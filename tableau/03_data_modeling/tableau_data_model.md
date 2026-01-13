🧩 Tableau Data Modeling Documentation
1. Overview

This project follows a database-first analytics approach, where all data cleansing, transformations, and business logic are handled within SQL Server. Tableau is used exclusively for visualization and presentation.

2. Data Sources Used

Each Tableau dashboard connects to one CSV file, exported from a validated SQL analytical view.

Dashboard	Data Source
Executive Overview	kpi_executive_overview.csv
Risk & Default Analysis	risk_default_analysis.csv
Portfolio Distribution	portfolio_distribution.csv
Loan Default Trends	loan_default_trends.csv
Drill-down / Exploration (optional)	loan_risk_master.csv
3. Data Granularity

Executive Overview: Single-row, fully aggregated KPI-level data

Risk & Default Analysis: Aggregated by risk segment and credit score band

Portfolio Distribution: Aggregated by loan type, loan amount band, and loan term band

Loan Default Trends: Aggregated by issue year and month

Loan Risk Master: Loan-level (one row per loan)

4. Modeling Approach

One data source per dashboard

No joins, unions, or blending performed in Tableau

No calculated KPI fields created in Tableau

All metrics originate from SQL analytical views

This approach ensures metric consistency, performance efficiency, and auditability.

5. Rationale for Design Choices

SQL is the single source of truth for calculations

Prevents KPI mismatches across dashboards

Simplifies Tableau workbooks

Mirrors enterprise BI best practices

6. Handling Relationships

Because each CSV already represents a complete analytical dataset at the required level of aggregation, no relationships or joins are required within Tableau.

This avoids:

Incorrect aggregations

Double counting

Performance issues

7. Tableau Public Considerations

Tableau Public does not support live database connections.
CSV exports of SQL views are therefore used as a delivery mechanism, not as the primary data source.

8. Limitations & Trade-offs

Data is static until CSVs are refreshed

Real-time updates are not available in Tableau Public

This limitation is documented and intentional
