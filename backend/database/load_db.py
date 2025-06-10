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