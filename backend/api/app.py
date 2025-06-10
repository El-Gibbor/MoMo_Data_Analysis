#!/usr/bin/python3
import os
from flask import Flask, jsonify, request
from flask_cors import CORS
from sqlalchemy import create_engine, func, extract, and_, or_
from sqlalchemy.orm import sessionmaker
from models import Transaction
from datetime import datetime, date
import urllib.parse
from dotenv import load_dotenv

app = Flask(__name__)
CORS(app)


# ================== [ Db setup/connection ] ==================
def get_db_connection():
    """
    Establishes and returns a MySQL database connection session.

    Returns:
        Session: A SQLAlchemy session object connected to the database.

    Environment Variables Required:
        DB_NAME: Name of the database
        DB_HOST: Database host address (defaults to "localhost")
        DB_PASSWORD: Database password
        DB_USER: Database username

    Note:
        The password is URL-encoded to handle special characters.
    """

    db = os.getenv("DB_NAME")
    host = os.getenv("DB_HOST", "localhost")
    password = urllib.parse.quote(os.getenv("DB_PASSWORD"))
    db_user = os.getenv("DB_USER")

    conn_url = f"mysql+mysqldb://{db_user}:{password}@{host}/{db}"

    engine = create_engine(conn_url, pool_pre_ping=True)
    Session = sessionmaker(bind=engine)
    return Session()

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

        # apply filter using the givien params
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
        if min_amount:
            query = query.filter(Transaction.amount >= float(min_amount))
        if max_amount:
            query = query.filter(Transaction.amount <= float(max_amount))
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


if __name__ == '__main__':
    # app.run(debug=True, host='0.0.0.0', port=5000)
    app.run(debug=True, host='0.0.0.0')
