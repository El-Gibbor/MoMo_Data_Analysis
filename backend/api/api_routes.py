#!/usr/bin/python3
import os
from flask import Flask, jsonify, request
from flask_cors import CORS
from sqlalchemy import create_engine, func, extract, and_, or_
from sqlalchemy.orm import sessionmaker
from models import Base, Transaction
from datetime import datetime, date
import urllib.parse
from dotenv import load_dotenv

load_dotenv()

app = Flask(__name__)
CORS(app)


# ============== [ Db setup/connection ] ==============
def get_db_connection():
    """
    Establishes and returns a PostgreSQL database connection session.

    Returns:
        Session: A SQLAlchemy session object connected to the database.

    Environment Variables:
        DATABASE_URL: Complete PostgreSQL connection URL
    """

    database_url = os.getenv("DATABASE_URL")
    engine = create_engine(database_url, pool_pre_ping=True)
    Session = sessionmaker(bind=engine)

    Base.metadata.create_all(engine)
    return Session()

# ================ [ API Endpoints ] ===================
@app.route('/api/transactions', methods=['GET'])
def get_transactions():
    """Get filtered transactions with pagination"""
    session = get_db_connection()

    try:
        # Get query parameters for filtering
        page = int(request.args.get('page', 1))
        per_page = int(request.args.get('per_page', 50))
        transaction_type = request.args.get('type')
        status = request.args.get('status')
        date_from = request.args.get('date_from')
        date_to = request.args.get('date_to')
        min_amount = request.args.get('min_amount')
        max_amount = request.args.get('max_amount')
        search = request.args.get('search')
        query = session.query(Transaction)  # build the query

        # apply filter using the given params
        if transaction_type:
            query = query.filter(Transaction.transaction_type == transaction_type)
        if status:
            query = query.filter(Transaction.t_status == status)
        if date_from:
            date_from_obj = datetime.strptime(date_from, '%Y-%m-%d')
            query = query.filter(Transaction.date_and_time >= date_from_obj)
        if date_to:
            date_to_obj = datetime.strptime(date_to, '%Y-%m-%d')
            query = query.filter(Transaction.date_and_time <= date_to_obj)
        # if min_amount:
        #     query = query.filter(Transaction.amount >= float(min_amount))
        # if max_amount:
        #     query = query.filter(Transaction.amount <= float(max_amount))
        if search:
            query = query.filter(or_(
                Transaction.description.contains(search),
                Transaction.sender.contains(search),
                Transaction.receiver.contains(search),
                Transaction.transaction_id.contains(search)
            ))

        # Get total count
        total = query.count()

        # ============= [ pagination ] ===============
        offset = (page - 1) * per_page
        transactions = query.offset(offset).limit(per_page).all()

        # Convert to a dict & return a paginated json of the requested data
        result = []

        for t in transactions:
            result.append({
                'id': t.id,
                'transaction_id': t.transaction_id,
                'external_transaction_id': t.external_transaction_id,
                'amount': float(t.amount) if t.amount else 0,
                'status': t.t_status,
                'transaction_type': t.transaction_type,
                'description': t.description,
                'date_and_time': t.date_and_time.isoformat() if t.date_and_time else None,
                'transaction_fee': float(t.transaction_fee) if t.transaction_fee else 0,
                'new_balance': float(t.new_balance) if t.new_balance else 0,
                'sender': t.sender,
                'receiver': t.receiver,
                'sender_momo_id': t.sender_momo_id,
                'institution_vendor': t.institution_vendor,
                'transaction_method': t.transaction_method,
                'agent': t.agent,
                'withdrawer': t.withdrawer,
                'power_token': t.power_token,
                'created_at': t.created_at.isoformat() if t.created_at else None
            })

        return jsonify({
            'transactions': result,
            'pagination': {
                'page': page,
                'per_page': per_page,
                'total': total,
                'pages': (total + per_page - 1) // per_page
            }
        })

    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        session.close()


@app.route('/api/summary', methods=['GET'])
def get_summary():
    """Get overall summary statistics of all transactions - Not paginated """
    session = get_db_connection()

    try:
        total_transactions = session.query(func.count(Transaction.id)).scalar()
        total_volume = session.query(func.coalesce(func.sum(Transaction.amount), 0)).scalar()
        average_amount = session.query(func.coalesce(func.avg(Transaction.amount), 0)).scalar()

        # Get the most common transaction type
        most_common_type = session.query(
            Transaction.transaction_type,
            func.count(Transaction.transaction_type).label('count')
        ).group_by(Transaction.transaction_type).order_by(func.count(Transaction.transaction_type).desc()).first()

        return jsonify({
            'total_transactions': total_transactions,
            'total_volume': float(total_volume),
            'average_amount': float(average_amount),
            'most_common_type': most_common_type[0] if most_common_type else None
        })

    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        session.close()


@app.route('/api/summary/vol-by-type', methods=['GET'])
def get_transaction_volume_by_type():
    session = get_db_connection()
    try:
        date_from = request.args.get('date_from')
        date_to = request.args.get('date_to')

        query = session.query(
            Transaction.transaction_type,
            func.sum(Transaction.amount).label('total_volume')
        ).group_by(Transaction.transaction_type)

        # filter by date
        if date_from:
            query = query.filter(Transaction.date_and_time >= datetime.strptime(date_from, '%Y-%m-%d'))
        if date_to:
            query = query.filter(Transaction.date_and_time <= datetime.strptime(date_to, '%Y-%m-%d'))

        results = query.all()

        summary = []
        for row in results:
            summary.append({
                'transaction_type': row.transaction_type or 'Unknown',
                'total_volume': float(row.total_volume) if row.total_volume else 0
            })

        return jsonify(summary)

    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        session.close()


@app.route('/api/summary/monthly', methods=['GET'])
def get_monthly_summary():
    """
    Get monthly transaction volume summaries.
    Optional filters: year, month, transaction_type
    """
    session = get_db_connection()

    try:
        year = request.args.get('year', type=int)
        month = request.args.get('month', type=int)
        transaction_type = request.args.get('transaction_type')


        query = session.query(
            func.extract('year', Transaction.date_and_time).label('year'),
            func.extract('month', Transaction.date_and_time).label('month'),
            func.coalesce(func.sum(Transaction.amount), 0).label('total_volume')
        )

        # Apply filters if provided
        if year:
            query = query.filter(func.extract('year', Transaction.date_and_time) == year)
        if month:
            query = query.filter(func.extract('month', Transaction.date_and_time) == month)
        if transaction_type:
            query = query.filter(Transaction.transaction_type == transaction_type)

        # Group and order the result
        query = query.group_by('year', 'month').order_by('year', 'month')
        results = query.all()

        # Format results
        summary = []
        for row in results:
            summary.append({
                'year': int(row.year),
                'month': int(row.month),
                'total_volume': float(row.total_volume)
            })

        return jsonify(summary)

    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        session.close()


@app.route('/api/summary/grouped', methods=['GET'])
def get_grouped_summary():

    # For mapping/categorizing transaction in deposit & payment
    CATEGORY_MAP = {
        # Deposits
        "Received funds": "deposits",
        "Bank deposit": "deposits",

        # Payments
        "MoMo code payments": "payments",
        "mobile number transactions": "payments",
        "Airtime": "payments",
        "Power bill payments": "payments",
        "withdrawal from agents": "payments",
        "Third party transactions": "payments",
        "Bundle purchase": "payments",
        "Bank transfer": "payments"
    }
    session = get_db_connection()
    try:
        transactions = session.query(Transaction).all()

        grouped_data = {
            "deposits": {},
            "payments": {}
        }

        for tx in transactions:
            label = (tx.transaction_type or "").strip()
            group = CATEGORY_MAP.get(label)

            if not group:
                continue  # Skip unknowns (or handle as 'uncategorized' if preferred)

            # Initialize if not exists
            if label not in grouped_data[group]:
                grouped_data[group][label] = {
                    "amount": 0,
                    "count": 0
                }

            grouped_data[group][label]["amount"] += float(tx.amount or 0)
            grouped_data[group][label]["count"] += 1

        return jsonify(grouped_data)

    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        session.close()



if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
