/* ============================================================
   FILE: 04_analytical_views.sql
   PROJECT: Bank Loan Risk & Portfolio Analytics
   DATABASE: SQL Server
   PURPOSE:
   Create KPI and analytical views from the
   loan-level master dataset for reporting
   and Tableau dashboards.
   ============================================================ */


---------------------------------------------------------------
-- 1. EXECUTIVE OVERVIEW KPIs
---------------------------------------------------------------

CREATE OR ALTER VIEW bank.KPI_Executive_Overview AS
(
  SELECT
    COUNT(DISTINCT Loan_ID) AS Total_Loans,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    SUM(CAST(Loan_Amount AS DECIMAL(18,2))) AS Total_Loan_Amount,
    AVG(Interest_Rate) AS Avg_Interest_Rate,
    SUM(CASE WHEN Default_Flag = 1 THEN 1 ELSE 0 END) * 1.0
        / NULLIF(COUNT(Loan_ID), 0) AS Default_Rate,
    SUM(CAST(CASE WHEN Default_Flag = 1 THEN Loan_Amount ELSE 0 END 
        AS DECIMAL(18,2))) AS Defaulted_Exposure
  FROM bank.Loan_Risk_Master
);


---------------------------------------------------------------
-- 2. RISK SEGMENT & DEFAULT ANALYSIS
---------------------------------------------------------------

CREATE OR ALTER VIEW bank.Risk_Default_Analysis AS
(
  SELECT
    Risk_Segment,
    Credit_Score_Band,
    COUNT(Loan_ID) AS Total_Loans,
    SUM(CAST(Loan_Amount AS DECIMAL(18,2))) AS Total_Exposure,
    SUM(CASE WHEN Default_Flag = 1 THEN 1 ELSE 0 END) AS Defaulted_Loans,
    SUM(CAST(CASE WHEN Default_Flag = 1 THEN Loan_Amount ELSE 0 END
        AS DECIMAL(18,2))) AS Defaulted_Exposure,
    SUM(CASE WHEN Default_Flag = 1 THEN 1 ELSE 0 END) * 1.0
        / NULLIF(COUNT(Loan_ID), 0) AS Default_Rate
  FROM bank.Loan_Risk_Master
  GROUP BY
    Risk_Segment,
    Credit_Score_Band
);


---------------------------------------------------------------
-- 3. PORTFOLIO DISTRIBUTION ANALYSIS
---------------------------------------------------------------

CREATE OR ALTER VIEW bank.Portfolio_Distribution AS
(
  SELECT
    Loan_Type,
    Loan_Amount_Band,
    Loan_Term_Band,
    COUNT(Loan_ID) AS Total_Loans,
    SUM(CAST(Loan_Amount AS DECIMAL(18,2))) AS Total_Loan_Amount,
    AVG(Interest_Rate) AS Avg_Interest_Rate
  FROM bank.Loan_Risk_Master
  GROUP BY
    Loan_Type,
    Loan_Amount_Band,
    Loan_Term_Band
);


---------------------------------------------------------------
-- 4. TIME-BASED LOAN & DEFAULT TRENDS
---------------------------------------------------------------

CREATE OR ALTER VIEW bank.Loan_Default_Trends AS
(
  SELECT
    Issue_Year,
    Issue_Month,
    COUNT(Loan_ID) AS Loans_Issued,
    SUM(CAST(Loan_Amount AS DECIMAL(18,2))) AS Loan_Amount_Issued,
    SUM(CASE WHEN Default_Flag = 1 THEN 1 ELSE 0 END) AS Defaulted_Loans,
    SUM(CASE WHEN Default_Flag = 1 THEN 1 ELSE 0 END) * 1.0
        / NULLIF(COUNT(Loan_ID), 0) AS Default_Rate
  FROM bank.Loan_Risk_Master
  GROUP BY
    Issue_Year,
    Issue_Month
);


---------------------------------------------------------------
-- ANALYTICAL LAYER NOTES
---------------------------------------------------------------
-- • All monetary aggregations are cast to DECIMAL(18,2)
-- • NULLIF prevents divide-by-zero errors
-- • No joins or data cleansing in this layer
-- • Views are Tableau-ready and KPI-safe

