📄 Executive Overview – User Requirements
1. Business Context

The bank offers multiple loan products, including Home Loans, Personal Loans, Auto Loans, and Education Loans, and manages a loan portfolio spanning 9 years of historical data from 2015 to 2024.

Senior leadership requires a single, high-level dashboard to quickly assess overall portfolio size, financial exposure, and credit risk across this period. The dashboard is intended to support strategic decision-making rather than operational monitoring.

2. Primary Stakeholders

Executive Management

Senior Credit Risk Leadership

Strategy & Analytics Team

3. Business Objective

Provide executives with a one-glance summary of the loan portfolio’s scale, risk exposure, and financial characteristics, enabling fast and informed decisions without navigating detailed reports or raw data.

4. Key Business Questions

The dashboard must answer the following questions:

How many loans exist in the portfolio?

How many customers are associated with these loans?

What is the total loan exposure (capital at risk)?

What percentage of loans have defaulted?

What is the total monetary exposure from defaulted loans?

What is the average interest rate across the loan portfolio?

5. Required KPIs

The dashboard must display only the following KPIs:

Total Loans

Total Customers

Total Loan Amount

Default Rate (%)

Defaulted Exposure

Average Interest Rate (%)

6. KPI Definition & Governance

KPI calculations are defined and validated in SQL using approved analytical views

Tableau is used strictly for presentation and visualization

KPIs are displayed as headline metrics only, without trend analysis or segmentation in this view

Metric definitions remain consistent across all dashboards and reports

7. Scope & Constraints

This dashboard is summary-level only

No filters, drill-downs, or segmentation are included

No joins or calculated KPIs are created within Tableau

Time-based analysis and risk segmentation are handled in separate dashboards

8. Success Criteria

The dashboard is considered successful if:

An executive can understand overall portfolio health in under 10 seconds

KPIs are visually clear and unambiguous

All displayed metrics exactly match SQL outputs

The dashboard requires no additional explanation to interpret

9. Out of Scope

Loan-level or customer-level analysis

Risk segmentation or credit score analysis

Time-series or trend-based insights
