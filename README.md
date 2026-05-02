# Telco Customer Churn Analysis

## Project Overview
Analyzed customer churn for a telecom company (7,043 customers) 
using Python, SQL and Power BI to identify key churn drivers 
and recommend data-driven retention strategies.

## Business Questions
1. Which contract type has the highest churn rate?
2. Is there a tenure danger zone where most customers leave?
3. How much monthly revenue is being lost to churn?

## Tools Used
- **Python** (Pandas, Matplotlib, Seaborn) — Data cleaning & EDA
- **SQL** (PostgreSQL) — Churn pattern analysis
- **Power BI** — Interactive dashboard

## Dataset
- Source: Kaggle — Telco Customer Churn
- Rows: 7,043 customers
- Columns: 21 (23 after feature engineering)

## Key Findings
- Overall churn rate is **26.54%**
- Month-to-month customers churn at **42.71%** vs **2.83%** for two-year contracts
- Customers in first **12 months** have the highest churn risk
- Fiber optic customers churn at **41.89%** — double the DSL rate
- Electronic check users churn at **45.29%** — 3x higher than automatic payment users
- **$139,130** in monthly revenue is lost to churn

## Recommendation
Target month-to-month customers in their first 12 months 
with retention offers — this single segment represents 
the highest churn risk and largest revenue impact.

## Project Structure
├── churn_analysis.ipynb   — Python cleaning & EDA
├── churn_analysis.sql     — SQL queries
├── Telco_Churn_Clean.csv  — Cleaned dataset
├── dashboard_preview.png  — Power BI dashboard
├── chart1_churn_distribution.png
├── chart2_churn_by_contract.png
├── chart3_churn_by_tenure.png
└── chart4_monthly_charges.png
