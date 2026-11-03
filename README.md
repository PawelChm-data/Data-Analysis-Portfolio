# Data Analysis Portfolio

A collection of SQL learning materials and hands-on projects focused on **SQL Server, data analysis, and data warehouse development**.

This repository documents my practical learning process — from SQL fundamentals and query-writing exercises to building a multi-layer data warehouse and using its analytical model to answer business questions.

## Focus Areas

- SQL querying, filtering, joins, and aggregations
- Data cleaning, transformation, and validation
- ETL development and data warehouse architecture
- Dimensional modeling and analytical views
- Business KPIs, trend analysis, ranking, and segmentation
- Git and GitHub for version control and project documentation

## Tools & Technologies

| Area | Tools |
|---|---|
| Database | Microsoft SQL Server |
| Query language | T-SQL |
| SQL environment | SQL Server Management Studio (SSMS) |
| Version control | Git, GitHub |
| Data formats | CSV, SQL Server backup files (`.bak`) |

## Repository Structure

```text
Data-Analysis-Portfolio/
│
├── README.md
│
└── SQL/
    │
    ├── Learning/
    │   ├── SQLBolt/
    │   │   ├── Datasets/
    │   │   ├── Lessons/
    │   │   ├── Practice/
    │   │   └── README.md
    │   │
    │   └── SQL Server/
    │       ├── Datasets/
    │       ├── Scripts/
    │       └── README.md
    │
    └── Projects/
        ├── Data Warehouse Engineering/
        │   ├── datasets/
        │   │   ├── source_crm/
        │   │   └── source_erp/
        │   ├── scripts/
        │   │   ├── bronze/
        │   │   ├── silver/
        │   │   └── gold/
        │   ├── LICENSE
        │   └── README.md
        │
        └── Data Analytics/
            ├── datasets/
            ├── scripts/
            ├── LICENSE
            └── README.md
```

## Learning

### [SQLBolt – SQL Fundamentals & Practice](SQL/Learning/SQLBolt/README.md)

A structured introduction to SQL based on the 18 interactive SQLBolt lessons, supported by additional practice exercises.

Topics include:

- `SELECT`, `WHERE`, sorting, and filtering
- Joins and handling `NULL` values
- Expressions and aggregate functions
- `GROUP BY` and `HAVING`
- Data modification with `INSERT`, `UPDATE`, and `DELETE`
- Table creation and modification

The folder also contains small CSV datasets used in supplementary exercises.

### [SQL Server – Practice Exercises](SQL/Learning/SQL%20Server/README.md)

A collection of **230 SQL Server exercises** organized into 23 scripts and built around the SalesDB sample database.

Topics progress from basic querying to more advanced analytical SQL:

- Filtering, joins, and set operators
- String and date functions
- `CASE` expressions and NULL handling
- Conditional aggregation and window functions
- Ranking, `LAG` / `LEAD`, CTEs, and subqueries

## Projects

### [Data Warehouse Engineering](SQL/Projects/Data%20Warehouse%20Engineering/README.md)

An end-to-end SQL Server data warehouse implementation integrating CRM and ERP source data.

The project uses a **Bronze, Silver, and Gold** architecture to demonstrate:

- Loading source CSV files into raw Bronze tables
- Cleaning, standardizing, and transforming data in the Silver layer
- Building customer and product dimensions and a sales fact view in the Gold layer
- Using stored procedures and T-SQL transformations to implement the loading process

### [Data Analytics](SQL/Projects/Data%20Analytics/README.md)

A collection of SQL-based analytical scripts built on the Gold-layer data model produced by the Data Warehouse Engineering project.

The analysis covers:

- Database and dimension exploration
- Business KPIs and revenue analysis
- Customer and product distributions
- Rankings and performance comparisons
- Monthly trends, running totals, and moving averages
- Customer and product segmentation
- Analytical customer and product reporting views

**Project dependency:** the Data Analytics scripts expect the `gold.fact_sales`, `gold.dim_customers`, and `gold.dim_products` objects created by the Data Warehouse Engineering project.

## How to Explore This Repository

1. Start with the SQLBolt materials to review the fundamentals.
2. Continue with the SQL Server exercises to practice T-SQL concepts using SalesDB.
3. Explore the Data Warehouse Engineering project to follow the data loading and transformation workflow.
4. Review the Data Analytics project to see how the resulting Gold-layer model can support business-oriented analysis.

Each learning section and project has its own README with more detailed information, prerequisites, and instructions.

## Data Sources & Disclaimer

The repository uses educational datasets from SQLBolt, Data with Baraa, and supplementary practice data.

No confidential, proprietary, or personal data from employers or other organizations is intentionally included.
