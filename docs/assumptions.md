# Assumptions

The following assumptions were made while performing the analysis:

## Data Assumptions
- The dataset represents historical loan data and is assumed to be accurate at the time of extraction.
- Missing or null values in key fields (such as credit score, income, or loan amount) were handled using appropriate data quality rules.
- Duplicate records, if any, were removed to avoid double-counting loans or customers.

## Business Assumptions
- A loan marked as defaulted represents a financial risk to the bank.
- Credit score is assumed to be a reliable indicator of borrower creditworthiness.
- Higher default rates indicate higher portfolio risk.
- Customer segments are assumed to behave consistently within each defined risk category.

## Analysis Scope Assumptions
- External factors such as macroeconomic conditions or policy changes are not considered in this analysis.
- The analysis focuses on identifying trends and patterns rather than predicting future defaults.
