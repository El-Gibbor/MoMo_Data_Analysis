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
         transaction_type (str): Type of transaction (e.g deposit, withdrawal).
        description (str): A human readable description for the transaction.
        date_and_time (datetime): Timestamp of the transaction.
        transaction_fee (Decimal): Any fee charged for the transaction.
        new_balance (Decimal): User balance after the transaction.
        sender (str): Sender's name, number, or reference.
        receiver (str): Receiver's name, number, or reference.
        sender_momo_id (str): Mobile Money system ID for the sender.
        institution_vendor (str): Vendor or institution involved, if any.
        transaction_method (str): Method used (e.g. cash etc).
        agent (str): Agent information for agent-based transactions.
        withdrawer (str): Person performing the withdrawal (if applicable).
        power_token (str): Token used for prepaid power transactions.
    """

        

        __tablename__ = 'transactions'

    id = Column(Integer, primary_key=True)
    transaction_id = Column(String(100), unique=True)
    external_transaction_id = Column(String(100))
    amount = Column(DECIMAL(12, 2), nullable=False)
    t_status = Column(String(20), nullable=False)
    