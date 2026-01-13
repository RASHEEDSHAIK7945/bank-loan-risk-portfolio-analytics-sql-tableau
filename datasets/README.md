## Dataset Information

This project uses a relational banking dataset loaded directly into
a SQL Server database.

The raw data is stored in normalized relational tables and represents
customer, loan, credit, and repayment status information commonly
found in banking and financial analytics systems.

The source tables used in this project are:
- Customers
- Loans
- Loan_Status
- Credit_Profile

Data cleansing, standardization, and transformation are performed
entirely in SQL using views. No intermediate CSV or Excel files are
generated, as the project follows a database-first analytics workflow
aligned with real-world enterprise environments.

The primary focus of this project is on data validation, transformation,
business logic implementation, and analytical modeling rather than
file-based data handling.


---

## Data Dictionary (Summary)

### Customers
| Column Name | Description |
|-----------|-------------|
| customer_id (PK) | Unique customer identifier |
| gender | Customer gender |
| age | Customer age |
| marital_status | Marital status (Single / Married / Divorced) |
| education | Education level |
| region | Geographic region |
| annual_income | Annual income amount |

---

### Loans
| Column Name | Description |
|-----------|-------------|
| loan_id (PK) | Unique loan identifier |
| customer_id (FK) | References Customers.customer_id |
| loan_type | Type of loan |
| loan_amount | Loan principal amount |
| interest_rate | Annual interest rate |
| loan_term | Loan duration in months |
| issue_date | Loan issue date |

---

### Loan_Status
| Column Name | Description |
|-----------|-------------|
| loan_id (FK) | References Loans.loan_id |
| loan_status | Current loan status |
| default_flag | Default indicator (1 = Defaulted, 0 = Non-defaulted) |

---

### Credit_Profile
| Column Name | Description |
|-----------|-------------|
| customer_id (FK) | References Customers.customer_id |
| credit_score | Numeric credit score |
| risk_segment | Credit risk classification |
