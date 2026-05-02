CREATE TABLE telco_churn (
    customer_id VARCHAR(20),
    gender VARCHAR(10),
    senior_citizen VARCHAR(5),
    partner VARCHAR(5),
    dependents VARCHAR(5),
    tenure INT,
    phone_service VARCHAR(5),
    multiple_lines VARCHAR(20),
    internet_service VARCHAR(20),
    online_security VARCHAR(20),
    online_backup VARCHAR(20),
    device_protection VARCHAR(20),
    tech_support VARCHAR(20),
    streaming_tv VARCHAR(20),
    streaming_movies VARCHAR(20),
    contract VARCHAR(20),
    paperless_billing VARCHAR(5),
    payment_method VARCHAR(30),
    monthly_charges DECIMAL(10,2),
    total_charges DECIMAL(10,2),
    churn VARCHAR(5),
    churn_flag INT,
    tenure_group VARCHAR(20)
);

--data loaded from export/import method


--Query 1 — Overall churn rate

-- What is the overall churn rate?
SELECT 
    COUNT(*) AS total_customers,
    SUM(churn_flag) AS churned_customers,
    ROUND(SUM(churn_flag) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM telco_churn;

--Query 2 — Churn by Contract Type

-- Which contract type has the highest churn rate?
SELECT 
    contract,
    COUNT(*) AS total_customers,
    SUM(churn_flag) AS churned_customers,
    ROUND(SUM(churn_flag) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM telco_churn
GROUP BY contract
ORDER BY churn_rate_percent DESC;

--Query 3 — Churn by Tenure Group

-- Which tenure group has the highest churn rate?
SELECT 
    tenure_group,
    COUNT(*) AS total_customers,
    SUM(churn_flag) AS churned_customers,
    ROUND(SUM(churn_flag) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM telco_churn
GROUP BY tenure_group
ORDER BY churn_rate_percent DESC;


-- Query 4 — Churn by Internet Service

-- Which internet service type has highest churn?
SELECT 
    internet_service,
    COUNT(*) AS total_customers,
    SUM(churn_flag) AS churned_customers,
    ROUND(SUM(churn_flag) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM telco_churn
GROUP BY internet_service
ORDER BY churn_rate_percent DESC;

--Query 5 — Monthly Revenue Lost to Churn

-- How much monthly revenue is being lost to churn?
SELECT 
    COUNT(*) AS churned_customers,
    ROUND(SUM(monthly_charges), 2) AS revenue_lost_monthly,
    ROUND(AVG(monthly_charges), 2) AS avg_charges_per_churned_customer
FROM telco_churn
WHERE churn_flag = 1;

--Query 6 — Churn by Payment Method

-- Which payment method has highest churn?
SELECT 
    payment_method,
    COUNT(*) AS total_customers,
    SUM(churn_flag) AS churned_customers,
    ROUND(SUM(churn_flag) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM telco_churn
GROUP BY payment_method
ORDER BY churn_rate_percent DESC;

-- Complete churn summary by key segments
SELECT 
    contract,
    tenure_group,
    internet_service,
    payment_method,
    COUNT(*) AS total_customers,
    SUM(churn_flag) AS churned_customers,
    ROUND(SUM(churn_flag) * 100.0 / COUNT(*), 2) AS churn_rate_percent,
    ROUND(SUM(monthly_charges), 2) AS monthly_revenue,
    ROUND(AVG(monthly_charges), 2) AS avg_monthly_charges
FROM telco_churn
GROUP BY 
    contract,
    tenure_group,
    internet_service,
    payment_method
ORDER BY churn_rate_percent DESC;




