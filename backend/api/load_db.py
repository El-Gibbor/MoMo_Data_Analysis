#!/usr/bin/python3

import os
import json
from glob import glob
from sqlalchemy import create_engine
from sqlalchemy.orm import Session
from sqlalchemy.exc import OperationalError
from models import Base, Transaction
from dotenv import load_dotenv

load_dotenv()

def load_to_db(session, json_path):
    """loads the cleaned JSON data to Render PostgreSQL db """
    try:
        with open(json_path, 'r') as f:
            data_read = json.load(f)

        inserted = 0
        updated = 0

        for item in data_read:
            tx_id = item.get("id")

            # Check if transaction already exists
            existing = session.query(Transaction).filter_by(id=tx_id).first()

            if existing:
                # Update fields
                for key, value in item.items():
                    setattr(existing, key, value)
                updated += 1
            else:
                session.add(Transaction(**item))
                inserted += 1

        session.commit()

        print(f"\n{json_path}: {inserted} inserted | {updated} updated")

    except FileNotFoundError:
        print(f"File not found: {json_path}")
    except json.JSONDecodeError as e:
        print(f"JSON error: {e}")
    except Exception as e:
        print(f" Unexpected error: {e}")

# ======== [ Entry Point: dbconnection and data populating ] ========
if __name__ == "__main__":
    database_url = os.getenv("DATABASE_URL")

    if not database_url:
        print("DATABASE_URL not set in .env")
        exit(1)

    try:
        engine = create_engine(database_url, pool_pre_ping=True)
        Base.metadata.create_all(engine)  # Create tables if not exist

        with Session(engine) as session:
            json_files = glob("backend/data/data_cleaning/cleaned_data/*.json")
            for json_file in json_files:
                load_to_db(session, json_file)

        print("\n==============================================")
        print("The Database is successfully populated!")
        print("==============================================")

    except OperationalError as conn_err:
        print(f"\nDB CONNECTION FAILED:\n{conn_err}")
