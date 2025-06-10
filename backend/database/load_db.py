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
