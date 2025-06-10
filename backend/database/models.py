#!/bin/python3

"""
Transaction model definition - SQLAlchemy ORM.

This model maps all the mobile money transaction records to the
'transactions' table in the database.
"""

from datetime import datetime, timezone
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, Text, DateTime, DECIMAL, func

Base = declarative_base()

class Transaction(Base):
    """
    Represents a mobile money transaction record in the database.

    Attributes:
        id (int): Pri key.
        transaction_id (str): Internal transaction identifier (unique).
        external_transaction_id (str): External vendor or partner ID.
        amount (Decimal): Transaction amount.
        t_status (str): Transaction status (e.g 'success', 'failed').

        

        __tablename__ = 'transactions'

    id = Column(Integer, primary_key=True)
    transaction_id = Column(String(100), unique=True)
    external_transaction_id = Column(String(100))
    amount = Column(DECIMAL(12, 2), nullable=False)
    t_status = Column(String(20), nullable=False)