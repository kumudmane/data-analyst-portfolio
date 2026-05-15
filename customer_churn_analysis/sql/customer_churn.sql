DROP TABLE IF EXISTS churn_data;

CREATE TABLE churn_data (
    customer_id TEXT,
    gender TEXT,
    senior_citizen Numeric,
    partner TEXT,
    dependents TEXT,
    tenure numeric,
    phone_service TEXT,
    multiple_lines TEXT,
    internet_service TEXT,
    online_security TEXT,
    online_backup TEXT,
    device_protection TEXT,
    tech_support TEXT,
    streaming_tv TEXT,
    streaming_movies TEXT,
    contract TEXT,
    paperless_billing TEXT,
    payment_method TEXT,
    monthly_charges NUMERIC,
    total_charges TEXT,
    churn TEXT
);
COPY churn_data
FROM 'C:/Users/Public/Documents/portfolio/excel/Telco-Customer-Churn.csv'
DELIMITER ','
CSV HEADER;

--Churn Rate (main KPI)
SELECT 
    COUNT(*) FILTER (WHERE churn = 'Yes') * 100.0 / COUNT(*) AS churn_rate
FROM churn_data;

--Contract vs Churn
SELECT 
    contract,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS churned,
    COUNT(*) AS total,
    ROUND(
        COUNT(*) FILTER (WHERE churn = 'Yes') * 100.0 / COUNT(*), 2
    ) AS churn_rate
FROM churn_data
GROUP BY contract
ORDER BY churn_rate DESC;

--Tenure Analysis
SELECT 
    CASE 
        WHEN tenure < 12 THEN '0-1 year'
        WHEN tenure < 24 THEN '1-2 years'
        ELSE '2+ years'
    END AS tenure_group,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS churned,
    COUNT(*) AS total
FROM churn_data
GROUP BY tenure_group
ORDER BY tenure_group;

--Monthly Charges vs Churn
SELECT 
    churn,
    ROUND(AVG(monthly_charges), 2) AS avg_monthly_charge
FROM churn_data
GROUP BY churn;

--Payment Method
SELECT 
    payment_method,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS churned
FROM churn_data
GROUP BY payment_method
ORDER BY churned DESC;

