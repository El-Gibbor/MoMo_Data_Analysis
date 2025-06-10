#!/bin/python3

import os
import json
from glob import glob
from sqlalchemy import create_engine
from sqlalchemy.orm import Session
from sqlalchemy.exc import OperationalError
from models import Base, Transaction
import urllib.parse
from dotenv import load_dotenv

load_dotenv()

def load_to_db(session, json_path):
    """Loads the cleaned json data to database"""
    try:
        with open(json_path, 'r') as f:
            data_read = json.load(f)

        transactions = []  # holds a list of all transactions (json)

        for item in data_read:
            transactions.append(Transaction(**item))
        session.add_all(transactions)
        session.commit()

        # Clear messages for succesfull database populating
        load_msg = f"DB LOADED: {len(transactions)} transactions from {json_path}"
        print()
        print('-' * len(load_msg))
        print(load_msg)
        print('-' * len(load_msg))
        print()

    except FileNotFoundError:
        print(f"JSON file not found: {json_path}")
    except json.JSONDecodeError as e:
        print(f"JSON decode error: {e}")

# ========= [ connect to db and populate it with transactions ] ============
if __name__ == "__main__":
    db = os.getenv("DB_NAME")
    host = os.getenv("DB_HOST", "localhost")
    password = urllib.parse.quote(os.getenv("DB_PASSWORD"))
    db_user = os.getenv("DB_USER")
    # print(password)?

    if not db_user or not password:
        print("DB_USER or DB_PASSWORD not set in .env")
        exit(1)

    conn_url = f"mysql+mysqldb://{db_user}:{password}@{host}/{db}"

    try:
        engine = create_engine(conn_url, pool_pre_ping=True)
        Base.metadata.drop_all(engine)
        Base.metadata.create_all(engine)

    # loops through all cleaned data (json) and load them to db
        with Session(engine) as session:
            json_files = glob("backend/data/data_cleaning/cleaned_data/*.json")
            for json_file in json_files:
                load_to_db(session, json_file)

        print("\n==============================================")
        print("The Database is successfully populated!")
        print("==============================================")

    except OperationalError as conn_err:
        print(f"\nDB CONNECTION FAILED:\n{conn_err}")
