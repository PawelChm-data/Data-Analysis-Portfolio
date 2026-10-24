# Data Analytics — SQL Server

A collection of SQL Server (T-SQL) queries for exploratory data analysis, ranking, time-series analysis, performance comparisons, segmentation, and customer/product reporting.

## Project structure

```text
Data-Analytics/
├── README.md
├── LICENSE
├── Datasets
│   ├── DataWarehouseAnalytics.bak
│   ├── dim.customers.csv
│   ├── dim_products.csv
│   └── fact_sales.csv
└── scripts/

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


## Related project

The scripts depend on the Gold layer created in the [Data Warehouse Project](../Data%20Warehouse%20Project/README.md) when this repository is arranged as a sibling project.
