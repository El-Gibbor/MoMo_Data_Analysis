# MTN MoMo Data (SMS) | Analysis Dashboard
This project transforms a dense XML archive of 1,600 MTN MoMo SMS transactions ranging from airtime purchases and bill payments to money transfers into a full-stack web app that reveals patterns, activity types, and transactional flows across Rwanda’s mobile money ecosystem.  
Exercising full-stack proficiency; backend workflows, structured data storage, and user interface design

## The task is to:
- [x] Clean and categorize the SMS data
- [x] Store the data in a relational database
- [x] Build an interactive frontend dashboard to analyze the data

 ## Project Structure
 ```
.
├── data/
│   └── modified_sms_v2.xml          # Provided raw XML file
├── backend/
│   ├── API/
│   │   └── app.py          # Backend API using Flask       
│   ├── database/      
├── frontend/
│   ├── index.html
│   ├── style.css
│   └── dashboard.js              # Interactivity and visualizations        
└── README.md
```
## Tasks in Detail
- **Data Cleaning & Processing:**  
Parse the XML using Python/JS libraries, categorize SMS by transaction type (e.g., payments, deposits, withdrawals), normalize fields (amounts, dates, phone numbers), and log unprocessed messages.
- **Database Design:**  
Design a relational schema (SQLite/MySQL/PostgreSQL) to store cleaned transactions with fields like ID, type, amount, parties, and timestamp. Ensure data integrity, handle duplicates, and insert via script.
- **Frontend Dashboard:**  
Build an interactive dashboard (HTML/CSS/JS) with search, filters, and data visualizations (e.g., volume by type, monthly summaries) using libraries like Chart.js or D3.js.
- **Backend API:**  
Create a REST API (Flask, FastAPI, or Node.js) to serve all, filtered, or summarized transactions. Connect it to the dashboard with async requests.
