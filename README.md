# MTN MoMo Data (SMS) | Analysis Dashboard
This project transforms a dense XML archive of 1,600 MTN MoMo SMS transactions ranging from airtime purchases and bill payments to money transfers into a full-stack web app that reveals patterns, activity types, and transactional flows across Rwanda’s mobile money ecosystem.
Exercising full-stack proficiency; backend workflows, structured data storage, and user interface design
## Tech Stack
- **Backend**
  - **API:** Flask
  - **Database:** PostgreSQL
  - **Data Cleaning & Extraction:** Python
- **Frontend**
  - **UI:** HTML, CSS
  - **Visualisation:** Javascript, Chart.js
###  Demos and Report
[Video Demo](https://www.youtube.com/watch?v=yro1_2dKy_I) | [Video Demo Contd.](https://youtu.be/hG15o1UlZpY) | [Live Site](https://grp-45-momo-data.onrender.com) | [Report](https://docs.google.com/document/d/1sqXJ4gRY-Eo4zMs1R8QItTE4GG4wq6HnPQnjzrH29f8/edit?usp=sharing)
## The task is to:
- [x] Clean and categorize raw SMS data in an xml file
- [x] Store the data in a relational database
- [x] Develop a backend API (Flask) to fetch data from the database for the frontend.
- [x] Build an interactive frontend dashboard to analyze the data

## Data Processing Pipeline
- `backend/data/`
  This directory is the heart of the project’s ETL (Extract, Transform, Load) process. It is structured into three main stages:
  - `raw_data/modified_sms_v2.xml` Contains unprocessed SMS transaction messages exported from a mobile device. These messages include various mobile money transactions such as deposits, withdrawals, airtime purchases, and more.
 - **Data Extraction** → `data_extraction/`
   This stage is responsible for parsing and categorizing raw SMS data. with the `categorize_data.py` module. Extracts and assigns each SMS message to a specific transaction type using a rule-based keyword matching.
    - `sms_category/`:
      Contains output XML files for each transaction category (e.g., bank_transfers.xml, bundle_purchases.xml, incoming_money.xml) after categorization (executing categorize_dat.py).
  - **Data Cleaning & Structuring** → `data_cleaning/`
This is where raw, categorized data gets cleaned and transformed into structured JSON format ready for database insertion.
    - Key Files:
        - `transaction_configs.py`: Configuration file that defines how each transaction type should be parsed (which regex pattern to apply).
        - `data_cleaner.py`: Applies specific parsing logic using the config file and extracts fields like amount, date, sender, receiver, etc., from transaction messages.
        - `use_data_cleaner.py`: Entry script that runs the cleaning process on categorized data.
        - `cleaned_data/`: Stores final JSON output files (e.g., airtime_payment.json, withdrawal_from_agents.json). Theses are files ready to be loaded into the database
- **Data Flow Summary** (ETL)
```
raw_data/modified_sms_v2.xml
    ↓
data_extraction/categorize_data.py
    ↓
data_extraction/sms_category/*.xml (categorized)
    ↓
data_cleaning/data_cleaner.py + transaction_configs.py
    ↓
data_cleaning/cleaned_data/*.json (cleaned structured output)
```
- **Sample Use case** - To extract, clean, and prepare the data:
```
# Step 1: Extract and Categorize
cd backend/data/data_extraction
python categorize_data.py

# Step 2: Clean and Structure
cd ../data_cleaning
python use_data_cleaner.py
```
The resulting JSON files in cleaned_data/ can then be loaded into your database using the `load_db.py` script in `backend/api`.
## API Endpoints (Live)
For ease of access, both the **API** and the **dashboard** are deployed on **Render**:
The Flask API is deployed at: https://momo-data-analysis.onrender.com and you can use this base url to build a query parameter for each endpoint
| Endpoint                           | Description                                                                                          | Query Parameters Example                                                                 |
|------------------------------------|------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|
| `/api/transactions`                | Fetch paginated transactions. Supports filters like type, status, search, and date range.           | `?page=1&per_page=20&type=Bank%20deposit&date_from=2024-01-01&date_to=2024-12-30`         |
| `/api/summary`                     | Returns total number of transactions, total volume, average amount, and most common type.           | No parameters required. Just use `/api/summary`                                           |
| `/api/summary/vol-by-type`        | Returns total volume grouped by `transaction_type`. Can be filtered by date range.                  | `?date_from=2024-01-01&date_to=2024-06-30`                                                |
| `/api/summary/monthly`            | Returns monthly aggregated volume. Supports optional filters for year and transaction type.         | `?year=2024&type=Withdrawal%20from%20agent`                                               |
| `/api/summary/group`              | Returns count and volume grouped by high-level categories (e.g., deposit, payment).                 | `?date_from=2024-01-01&date_to=2024-06-30`                                                |

You can now directly test endpoints by appending them to the base URL together with the optional query params.
**Example**:
  https://momo-data-analysis.onrender.com/api/transactions?page=1&per_page=20&type=Bank%20deposit&date_from=2024-01-01&date_to=2024-12-30
## Live Demo
### Live Dashboard (Render static site)
- **Dashboard URL**: [https://grp-45-momo-data.onrender.com](https://grp-45-momo-data.onrender.com)
  This dashboard is statically hosted and visualizes transaction insights by consuming data from the live API. You can explore it through the link above or you can run it locally: ⬇️
```
git clone https://github.com/El-Gibbor/MoMo_Data_Analysis.git
cd MoMo_Data_Analysis/frontend

# step 2:
# Open the index.html file in your browser
```

## ⚠️ Important Notice
This project uses **Render's free-tier PostgreSQL** database for continuous access to transaction data.
- **Database Sleep Mode**:
  On the free plan, if the API or database is not pinged regularly, the service goes to sleep. When this happens, the **first API request may take a long time** (up to 40 seconds) as the service wakes up.
- **Deletion Warning**:
  Render has notified that **this free-tier database will be deleted after July 10** unless the account is upgraded to a paid plan.
- **No Data After July 10?**
  If you're checking this project **on or after July 10th** and cannot access any transaction data, it's likely because the database was deleted by Render due to the free-tier policy.
