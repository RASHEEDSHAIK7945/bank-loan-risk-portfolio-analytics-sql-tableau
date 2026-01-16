## Project Overview

This project is an end-to-end analytics solution focused on analyzing a bank’s loan
portfolio to understand risk exposure, default behavior, and portfolio distribution
over time.

The objective is to support executive decision-making by providing:
- High-level portfolio KPIs
- Time-based loan and default trends
- Loan distribution analysis by type, amount, and tenure

The project follows a real-world analytics workflow using SQL for data preparation
and Tableau for visualization and storytelling.

## Repository Structure

bank-loan-risk-portfolio-analytics-sql-tableau/
│
├── sql/ # SQL scripts for data preparation & analytics
│ ├── 01_data_quality_checks.sql
│ ├── 02_data_transformation.sql
│ ├── 03_business_logic.sql
│ └── 04_analytical_views.sql
│
├── datasets/ # CSV files exported from SQL views
│ └── README.md # Dataset description & data dictionary
│
├── tableau/
│ ├── dashboard_pre_design_layout/ # draw.io wireframes used for planning
│ ├── dashboards/ # Final dashboard screenshots
│ └── tableau_files/ # Tableau packaged workbook (.twbx)
│
├── docs/
│ └── insights_and_recommendations.md
│
├── README.md
└── LICENSE

## Dashboards Overview

The Tableau solution consists of the following dashboards:

- **Home Navigation**
  - Acts as a landing page to navigate across all dashboards.

- **Executive Overview**
  - Presents high-level KPIs such as total loans, total customers,
    total loan amount, default rate, and defaulted exposure.

- **Portfolio Trends**
  - Analyzes loan issuance and default behavior over time,
    helping identify growth patterns and risk trends.

- **Portfolio Distribution**
  - Breaks down the loan portfolio by loan type, loan amount bands,
    and loan term categories to understand exposure concentration.



