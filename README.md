# ETL Data Quality Monitoring

A data engineering project that performs ETL (Extract, Transform, Load) operations and monitors data quality on an E-Commerce Sales dataset using Python, SQL, and Tableau.

---

## Problem Statement
Real-world data often contains nulls, duplicates, negative values, and outliers that affect business decisions. This project builds an automated ETL pipeline to detect, clean, and monitor data quality issues and visualize KPIs through an interactive Tableau dashboard.

---

## Tools & Technologies
- **Python** (Pandas, NumPy, Matplotlib, Seaborn)
- **SQL** (SQLite)
- **Tableau** (Dashboard & Visualization)
- **Google Colab** (Development Environment)

---

## Dataset
- **Source:** [E-Commerce Dataset - Kaggle](https://www.kaggle.com/datasets/carrie1/ecommerce-data)
- **Size:** 5,41,909 rows × 8 columns
- **Domain:** E-Commerce / Retail Sales

---

## Data Quality Issues Found

| Issue | Column | Count |
|---|---|---|
| Null Values | CustomerID | 1,35,080 (24.93%) |
| Null Values | Description | 1,454 (0.27%) |
| Duplicate Records | All Columns | 5,268 (0.97%) |
| Negative Quantity | Quantity | 10,624 |
| Zero/Negative Price | UnitPrice | 2,515 |

---

## ETL Pipeline

### Extract
- Loaded raw e-commerce dataset (5,41,909 rows)
- Performed initial data profiling and quality checks

### Transform
- Removed 5,268 duplicate records
- Filled null descriptions with 'Unknown'
- Dropped rows with null CustomerID
- Removed negative quantity records (returns/cancellations)
- Removed zero/negative unit price records
- Converted InvoiceDate to DateTime format
- Added TotalPrice calculated column

### Load
- Exported cleaned dataset (3,92,692 rows) to CSV
- Loaded into SQLite database for SQL analysis

---

## KPI Summary (After Cleaning)

| Metric | Value |
|---|---|
| Total Records | 3,92,692 |
| Total Revenue | ₹88,87,208.89 |
| Avg Order Value | ₹22.63 |
| Unique Customers | 4,338 |
| Unique Products | 3,665 |
| Total Countries | 37 |

---

## SQL Analysis
Key SQL queries written to validate data quality and extract insights:
- Null value checks across all columns
- Duplicate record detection
- KPI summary (revenue, orders, customers)
- Revenue by country (Top 10)
- Monthly revenue trend analysis

---

## Tableau Dashboard
Built an interactive dashboard with 4 views:
- KPI Summary Cards
- Revenue by Country (Top 10) — Bar Chart
- Monthly Revenue Trend — Line Chart
- Data Quality Summary Table

---

## Project Structure
etl-data-quality-monitoring/
├── ETL_Data_Quality.ipynb       # Main Python notebook (ETL + Quality Checks)
├── data_quality_checks.sql      # SQL queries for data quality validation
├── data_quality_dashboard.twbx  # Tableau dashboard file
├── .gitignore                   # Excludes large CSV files
└── README.md                    # Project documentation

---

## Key Insights
- **UK dominates** revenue with 82% of total sales
- **November 2011** was the highest revenue month (₹11,56,205)
- **24.93% of CustomerIDs** were missing — major data quality issue
- After cleaning, dataset reduced from **5,41,909 to 3,92,692 rows**

---

## How to Run
1. Clone this repository
2. Download dataset from Kaggle link above
3. Open `ETL_Data_Quality.ipynb` in Google Colab
4. Mount Google Drive and update file path
5. Run all cells sequentially
6. Open `data_quality_dashboard.twbx` in Tableau Desktop
