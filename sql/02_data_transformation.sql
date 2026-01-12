/* ============================================================
   FILE: 02_data_transformation.sql
   PROJECT: Bank Loan Risk & Portfolio Analytics
   DATABASE: SQL Server
   PURPOSE:
   Create analytics-ready transformation views for each
   core entity without altering raw source data.
   ============================================================ */


---------------------------------------------------------------
-- CUSTOMERS TRANSFORMATION VIEW
---------------------------------------------------------------

CREATE OR ALTER VIEW bank.Customers_Transformed AS
(
  SELECT
    customer_id           AS Customer_ID,
    TRIM(gender)          AS Gender,
    TRIM(marital_status)  AS Marital_Status,
    TRIM(education)       AS Education,
    TRIM(region)          AS Region,
    age                   AS Age,
    CASE
        WHEN age BETWEEN 21 AND 30 THEN '21–30'
        WHEN age BETWEEN 31 AND 40 THEN '31–40'
        WHEN age BETWEEN 41 AND 50 THEN '41–50'
        WHEN age BETWEEN 51 AND 60 THEN '51–60'
        ELSE '60+'
    END                   AS Age_Group,
    annual_income         AS Annual_Income,
    CASE
        WHEN annual_income < 300000 THEN 'Low Income'
        WHEN annual_income BETWEEN 300000 AND 700000 THEN 'Middle Income'
        WHEN annual_income BETWEEN 700001 AND 1500000 THEN 'Upper Middle Income'
        ELSE 'High Income'
    END                   AS Income_Band
   FROM bank.Customers
);


---------------------------------------------------------------
-- LOANS TRANSFORMATION VIEW
---------------------------------------------------------------

CREATE OR ALTER VIEW bank.Loans_Transformed AS
(
  SELECT
    loan_id               AS Loan_ID,
    customer_id           AS Customer_ID,
    TRIM(loan_type)       AS Loan_Type,
    loan_amount           AS Loan_Amount,
    CASE
        WHEN loan_amount < 300000 THEN 'Small Loan'
        WHEN loan_amount BETWEEN 300000 AND 800000 THEN 'Medium Loan'
        WHEN loan_amount BETWEEN 800001 AND 2000000 THEN 'Large Loan'
        ELSE 'Very Large Loan'
    END                   AS Loan_Amount_Band,
    interest_rate         AS Interest_Rate,
    CASE
        WHEN interest_rate < 8 THEN 'Low Rate'
        WHEN interest_rate BETWEEN 8 AND 12 THEN 'Medium Rate'
        ELSE 'High Rate'
    END                   AS Interest_Rate_Band,
    loan_term             AS Loan_Term,
    CASE
        WHEN loan_term <= 36 THEN 'Short Term'
        WHEN loan_term BETWEEN 37 AND 84 THEN 'Medium Term'
        ELSE 'Long Term'
    END                   AS Loan_Term_Band,
    issue_date            AS Issue_Date,
    YEAR(issue_date)      AS Issue_Year,
    MONTH(issue_date)     AS Issue_Month
  FROM bank.Loans
);


---------------------------------------------------------------
-- CREDIT PROFILE TRANSFORMATION VIEW
---------------------------------------------------------------

CREATE OR ALTER VIEW bank.Credit_Profile_Transformed AS
(
  SELECT
    customer_id           AS Customer_ID,
    credit_score          AS Credit_Score,
    CASE
        WHEN credit_score < 580 THEN 'Poor'
        WHEN credit_score BETWEEN 580 AND 669 THEN 'Fair'
        WHEN credit_score BETWEEN 670 AND 739 THEN 'Good'
        WHEN credit_score BETWEEN 740 AND 799 THEN 'Very Good'
        ELSE 'Excellent'
    END                   AS Credit_Score_Band,
    TRIM(risk_segment)    AS Risk_Segment
  FROM bank.Credit_Profile
);


---------------------------------------------------------------
-- LOAN STATUS TRANSFORMATION VIEW
---------------------------------------------------------------

CREATE OR ALTER VIEW bank.Loan_Status_Transformed AS
(
  SELECT
    loan_id               AS Loan_ID,
    TRIM(loan_status)     AS Loan_Status,
    default_flag          AS Default_Flag,
    CASE
        WHEN default_flag = 1 THEN 'Defaulted'
        ELSE 'Non-Defaulted'
    END                   AS Loan_Outcome
  FROM bank.Loan_Status
);


---------------------------------------------------------------
-- END OF TRANSFORMATION LAYER
---------------------------------------------------------------
-- Notes:
-- • All transformations are view-based
-- • Raw source data remains unchanged
-- • No joins or aggregations applied
-- • Designed for downstream business logic & Tableau analysis

