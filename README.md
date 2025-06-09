# MTN MoMo Data (SMS) | Analysis Dashboard
This project transforms a dense XML archive of 1,600 MTN MoMo SMS transactions ranging from airtime purchases and bill payments to money transfers into a full-stack web app that reveals patterns, activity types, and transactional flows across Rwanda’s mobile money ecosystem.
Exercising full-stack proficiency; backend workflows, structured data storage, and user interface design

## The task is to:
- [x] Clean and categorize the SMS data
- [x] Store the data in a relational database
- [x] Build an interactive frontend dashboard to analyze the data
- [x] Develop a backend API (Flask) to fetch data from the database for the frontend.

 ## Project Structure
```text
├── Backend/                        # all backend-related code and modules
│   ├── api/                        # Main API logic (Flask)
│   │   ├── app.py
│   │   └── __init__.py                       # Makes API a Python package
│   ├── data/                                 # Handles data processing, cleaning, and schema
│   │   ├── data_cleaning/                    # Modules for cleaning extracted data
│   │   │   ├── cleaned_data/                 # Final JSON output after cleaning
│   │   │   │   ├── airtime_payment.json
│   │   │   │   ├── bank_deposits.json
│   │   │   │   ├── bank_transfers.json
│   │   │   │   ├── bundle_purchases.json
│   │   │   │   ├── incoming_money.json
│   │   │   │   ├── momo_code_payments.json
│   │   │   │   ├── power_bill_payments.json
│   │   │   │   ├── third_party_transactions.json
│   │   │   │   ├── transfer_to_mobile_num.json
│   │   │   │   └── withdrawal_from_agents.json
│   │   │   ├── data_cleaner.py/                   # cleaning logic per transaction type
│   │   │   ├── __init__.py
│   │   │   ├── transaction_configs.py             # Configuration patterns for classifying transactions
│   │   │   └── use_data_cleaner.py                # script that applies the cleaner to raw data
│   │   ├── data_extraction/                       # Parsing and categorizing SMS messages
│   │   │   ├── categorize_data.py                 # Logic to classify SMS into known transaction types
│   │   │   ├── __init__.py
│   │   │   └── sms_category/                      # Data that are categorized into their specific transaction
│   │   │       ├── airtime_payments.xml
│   │   │       ├── bank_deposits.xml
│   │   │       ├── bank_transfers.xml
│   │   │       ├── bundle_purchases.xml
│   │   │       ├── incoming_money.xml
│   │   │       ├── __init__.py
│   │   │       ├── momo_code_payment.xml
│   │   │       ├── non_transaction_sms.xml
│   │   │       ├── power_bill_payment.xml
│   │   │       ├── thirdParty_transactions.xml
│   │   │       ├── transfers_to_mobileNum.xml
│   │   │       └── withdrawal_from_agents.xml
│   │   └── raw_data/                                  # Original SMS dataset before cleaning
│   │       ├── __init__.py
│   │       └── modified_sms_v2.xml
│   ├── sql_schema/                      # SQL schema files to define and dump DB structure
│   │   ├── momo_data_dump.sql           # Dump of the whole db (MoMo transactions)
│   │   └── schema.sql                   # SQL Schema file - table definitions
│   ├── database/                        # Handles database connection and ORM models
│   │   ├── db_connect.py                # Connects our app to MySQL
│   │   ├── __init__.py
│   │   └── models.py                    # ORM model definitions (SQLAlchemy)
│   ├── __init__.py
├── frontend/                            # Static frontend files
│   ├── assets/
│   │   └── logo.png
│   ├── dashboard.html                   # Main HTML dashboard (UI)
│   ├── script/
│   │   └── script.js                    # JavaScript for interactivity or API calls
│   └── style/
│       └── style.css                    # Custom styles for the dashboard
├── LICENSE
├── README.md
└── requirements.txt                     # Python dependencies
```

## Tasks in Detail
- **Data Cleaning & Processing:**
  - Parse the XML using Python ml.etree.ElementTree library
  - Categorize SMS by transaction type (e.g., payments, deposits, withdrawals)
  - Normalize fields (amounts, dates, phone numbers), and
  - Log unprocessed messages.
- **Database Design:**
  - Design a relational schema (SMySQL) to store cleaned transactions with fields like ID, type, amount, parties, and timestamp.
  - Ensure data integrity, Handle duplicates, and insert via script.
- **Frontend Dashboard:**
  - Build an interactive dashboard (HTML/CSS/JS) with
  - Search, filters, and data visualizations (e.g., volume by type, monthly summaries) using libraries like Chart.js
- **Backend API:**
  - Create a REST API (Flask) to serve all, filtered, or summarized transactions.
  - Connect it to the dashboard with async requests.
