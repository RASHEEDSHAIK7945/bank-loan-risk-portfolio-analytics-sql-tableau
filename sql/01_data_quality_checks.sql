/* ============================================================
   FILE: 01_data_quality_checks.sql
   PROJECT: Bank Loan Risk & Portfolio Analytics
   DATABASE: SQL Server
   PURPOSE:
   Perform initial data quality and profiling checks on
   the customers, loans, and loan_status tables before analysis.
   ============================================================ */


/* ============================================================
   1. PRIMARY KEY VALIDATION
   ============================================================ */

-- Check for NULL values in primary key
SELECT COUNT(*) AS null_customer_id_count
FROM bank.Customers
WHERE customer_id IS NULL;

-- Check for duplicate customer IDs
SELECT customer_id, COUNT(*) AS record_count
FROM bank.Customers
GROUP BY customer_id
HAVING COUNT(*) > 1;


/* ============================================================
   2. NULL VALUE CHECKS (NON-PRIMARY COLUMNS)
   ============================================================ */

SELECT
    SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS null_gender,
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS null_age,
    SUM(CASE WHEN marital_status IS NULL THEN 1 ELSE 0 END) AS null_marital_status,
    SUM(CASE WHEN education IS NULL THEN 1 ELSE 0 END) AS null_education,
    SUM(CASE WHEN region IS NULL THEN 1 ELSE 0 END) AS null_region,
    SUM(CASE WHEN annual_income IS NULL THEN 1 ELSE 0 END) AS null_annual_income
FROM bank.Customers;


/* ============================================================
   3. INVALID / ZERO VALUE CHECKS
   ============================================================ */

-- Annual income should be greater than zero
SELECT COUNT(*) AS invalid_annual_income_count
FROM bank.Customers
WHERE annual_income <= 0;

-- Age range validation
SELECT
    MIN(age) AS min_age,
    MAX(age) AS max_age
FROM bank.Customers;


/* ============================================================
   4. CUSTOMER DISTRIBUTION CHECKS
   ============================================================ */

-- Total customers
SELECT COUNT(customer_id) AS total_customers
FROM bank.Customers;

-- Gender distribution
SELECT gender, COUNT(*) AS customer_count
FROM bank.Customers
GROUP BY gender;

-- Marital status distribution
SELECT marital_status, COUNT(*) AS customer_count
FROM bank.Customers
GROUP BY marital_status;

-- Education level distribution
SELECT education, COUNT(*) AS customer_count
FROM bank.Customers
GROUP BY education;

-- Region-wise distribution
SELECT region, COUNT(*) AS customer_count
FROM bank.Customers
GROUP BY region;


/* ============================================================
   5. AGE VS MARITAL STATUS (LOGICAL CONSISTENCY CHECK)
   ============================================================ */

SELECT
    marital_status,
    MIN(age) AS min_age,
    MAX(age) AS max_age
FROM bank.Customers
GROUP BY marital_status;


/* ============================================================
   6. AGE VS EDUCATION LEVEL (LOGICAL CONSISTENCY CHECK)
   ============================================================ */

SELECT
    education,
    MIN(age) AS min_age,
    MAX(age) AS max_age
FROM bank.Customers
GROUP BY education;


/* ============================================================
   7. LOAN STATUS DATA QUALITY CHECKS
   ============================================================ */

-- Total distinct loans
SELECT COUNT(DISTINCT loan_id) AS total_loans
FROM bank.Loan_status;

-- Loan status distribution
SELECT loan_status, COUNT(*) AS total_loans
FROM bank.Loan_status
GROUP BY loan_status;


/* ============================================================
   8. LOANS TABLE DATA PROFILING
   ============================================================ */

-- Available loan types
SELECT DISTINCT loan_type
FROM bank.loans;

-- Loan issue date range
SELECT
    MIN(issue_date) AS start_date,
    MAX(issue_date) AS end_date,
    DATEDIFF(YEAR, MIN(issue_date), MAX(issue_date)) AS total_years
FROM bank.Loans;

-- Loan amount range check
SELECT
    MIN(loan_amount) AS min_loan_amount,
    MAX(loan_amount) AS max_loan_amount
FROM bank.Loans;


/* ============================================================
   DATA QUALITY OBSERVATIONS
   ============================================================ */

-- The customers table is structurally clean with no NULLs,
-- duplicates, or invalid primary keys.
-- Demographic attributes (age vs marital status and age vs education)
-- show unrealistic combinations due to synthetic data generation.
-- These attributes will be analyzed at aggregated levels
-- rather than enforcing strict real-world eligibility rules.
