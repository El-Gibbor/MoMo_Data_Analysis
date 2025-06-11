#!/usr/bin/python3

import os
from sqlalchemy import create_engine
from models import Base
from dotenv import load_dotenv

load_dotenv()

def create_tables():
    """Create all tables in the database"""
    # Get DATABASE_URL from Render environment
    database_url = os.getenv("DATABASE_URL")

    if not database_url:
        print("DATABASE_URL not found in environment variables")
        return False

    try:
        # Create engine
        engine = create_engine(database_url)

        # Create all tables
        Base.metadata.create_all(engine)

        print("Successfully created!")
        return True

    except Exception as e:
        print(f"Error creating tables: {e}")
        return False

if __name__ == "__main__":
    create_tables()
