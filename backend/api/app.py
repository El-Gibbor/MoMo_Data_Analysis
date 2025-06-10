#!/usr/bin/python
import os
import urllib.parse
from dotenv import load_dotenv
from sqlalchemy import create_engine, func, extract, and_, or_
from sqlalchemy.orm import sessionmaker

load_dotenv()


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
