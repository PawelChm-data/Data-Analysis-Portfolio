# Advanced Data Analytics — SQL Server

A collection of SQL Server (T-SQL) queries for exploratory data analysis, ranking, time-series analysis, performance comparisons, segmentation, and customer/product reporting.

## Project structure

```text
Advanced-Data-Analytics-Project/
├── README.md
├── Exploratory-Data-Analysis/
│   ├── 01_Database_and_Dimensions/
│   ├── 02_Business_Metrics/
│   └── 03_Distribution_and_Revenue/
├── Ranking-Analysis/
└── Advanced-Analytics/
    ├── 01_Time_Analysis/
    ├── 02_Performance_Analysis/
    ├── 03_Part_to_Whole/
    ├── 04_Segmentation/
    └── 05_Reports/
```

## Prerequisites

- Microsoft SQL Server and SQL Server Management Studio (SSMS).
- The `gold.fact_sales`, `gold.dim_customers`, and `gold.dim_products` views/tables must already exist.
- These Gold-layer objects are produced by the separate **Data Warehouse Project**. Set that project up and load its data before running these scripts.

## How to use

1. Open a `.sql` file in SSMS.
2. Confirm the active database contains the required `gold` objects.
3. Run one script at a time and inspect the result set.
4. Report scripts create or update views in the `gold` schema. Run them only if you have permission to create views and want to publish those reports.

## Topics covered

- Database metadata and dimension exploration
- Business KPIs and customer/product distributions
- Revenue analysis by category, customer, and country
- Top/bottom product rankings and customer rankings
- Monthly sales trends, running totals, and moving averages
- Product performance versus average and prior periods
- Category contribution to total sales
- Product cost and customer spending segmentation
- Customer and product reporting views

## Important interpretation notes

- `DATEDIFF` counts date-part boundaries; it does not calculate an exact elapsed duration.
- The customer age calculation in the customer report adjusts for whether the birthday has occurred this year.
- Month-over-month analysis uses a full month-start date, not only the month number, so months from different years are not mixed together.
- Ranking queries based on `gold.fact_sales` rank products/customers represented in sales data; they do not include products with no sales unless the query is explicitly changed to start from the dimension.
- Segmentation thresholds are illustrative business rules and should be adjusted to the business context.
- These scripts are learning/portfolio examples, not a production-ready reporting layer.

## Related project

The scripts depend on the Gold layer created in the [Data Warehouse Project](../Data%20Warehouse%20Project/README.md) when this repository is arranged as a sibling project. Update that relative link if your folder structure differs.
