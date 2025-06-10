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
