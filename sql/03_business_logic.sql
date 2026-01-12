/* ============================================================
   FILE: 03_business_logic.sql
   PROJECT: Bank Loan Risk & Portfolio Analytics
   DATABASE: SQL Server
   PURPOSE:
   Combine transformed entities into a single
   loan-level master dataset for risk analysis.
   ============================================================ */


---------------------------------------------------------------
-- LOAN – CUSTOMER RISK MASTER VIEW
---------------------------------------------------------------

CREATE OR ALTER VIEW bank.Loan_Risk_Master AS
(
  SELECT
    -- Loan identifiers
    l.Loan_ID,
    l.Customer_ID,

    -- Loan attributes
    l.Loan_Type,
    l.Loan_Amount,
    l.Loan_Amount_Band,
    l.Interest_Rate,
    l.Interest_Rate_Band,
    l.Loan_Term,
    l.Loan_Term_Band,
    l.Issue_Date,
    l.Issue_Year,
    l.Issue_Month,

    -- Customer demographics
    c.Gender,
    c.Age,
    c.Age_Group,
    c.Marital_Status,
    c.Education,
    c.Region,
    c.Annual_Income,
    c.Income_Band,

    -- Credit profile
    cp.Credit_Score,
    cp.Credit_Score_Band,
    cp.Risk_Segment,

    -- Loan outcome
    ls.Loan_Status,
    ls.Default_Flag,
    ls.Loan_Outcome

  FROM bank.Loans_Transformed l
  LEFT JOIN bank.Customers_Transformed c
    ON l.Customer_ID = c.Customer_ID
  LEFT JOIN bank.Credit_Profile_Transformed cp
    ON l.Customer_ID = cp.Customer_ID
  LEFT JOIN bank.Loan_Status_Transformed ls
    ON l.Loan_ID = ls.Loan_ID
);


---------------------------------------------------------------
-- BUSINESS LOGIC NOTES
---------------------------------------------------------------
-- • Grain of this view: 1 row = 1 loan
-- • Customers may appear multiple times (multiple loans)
-- • Default_Flag is preserved as business-defined outcome
-- • LEFT JOINs ensure no loan records are lost
-- • This view is the single source for KPI & dashboard layers

