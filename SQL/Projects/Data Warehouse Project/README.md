# Data Warehouse Project

## Overview

This project demonstrates the development of a SQL-based data warehouse using **Microsoft SQL Server and T-SQL**.

The project integrates CRM and ERP data from CSV source files into a centralized data warehouse. Data is processed through three layers — Bronze, Silver, and Gold — following the Medallion Architecture.

The implementation covers database initialization, raw data ingestion, data cleansing, standardization, integration, dimensional modeling, and basic data quality validation.

This repository is part of my Data Analysis Portfolio and documents my practical work with SQL Server, ETL processes, and data warehouse design.

## Project Objectives

- Build a data warehouse using Microsoft SQL Server.
- Load CRM and ERP source data from CSV files.
- Implement the Bronze, Silver, and Gold layers.
- Develop stored procedures for data loading and transformation.
- Clean and standardize customer, product, sales, and ERP data.
- Integrate source systems using SQL joins.
- Create customer and product dimensions and a sales fact view.
- Apply data quality checks and validate relationships between datasets.
- Practice SQL development, data modeling, and ETL design.

## Technologies

- **Database:** Microsoft SQL Server
- **Query Language:** T-SQL
- **Source Data:** CRM and ERP CSV files
- **Architecture:** Medallion Architecture
- **Data Modeling:** Fact and dimension views, Star Schema
- **ETL:** Stored procedures, `BULK INSERT`, SQL transformations
- **Version Control:** Git and GitHub

## Repository Structure

```text
Data-Analysis-Portfolio/
└── SQL/
    └── Projects/
        └── Data Warehouse Project/
            ├── README.md
            ├── LICENSE
            ├── datasets/
            │   ├── source_crm/
            │   │   ├── cust_info.csv
            │   │   ├── prd_info.csv
            │   │   └── sales_details.csv
            │   └── source_erp/
            │       ├── CUST_AZ12.csv
            │       ├── LOC_A101.csv
            │       └── PX_CAT_G1V2.csv
            └── scripts/
                ├── init_database.sql
                ├── bronze/
                │   ├── ddl_bronze.sql
                │   └── proc_load_bronze.sql
                ├── silver/
                │   ├── ddl_silver.sql
                │   └── proc_load_silver.sql
                └── gold/
                    └── ddl_gold.sql
```

## Data Architecture

The project follows the **Medallion Architecture**, separating raw data ingestion, data transformation, and analytical data modeling.

### 1. Bronze Layer — Raw Data

The Bronze layer stores data imported from the CRM and ERP CSV files.

Implemented functionality:
- Creates six Bronze tables.
- Imports CSV files using `BULK INSERT`.
- Skips the header row during ingestion.
- Uses `TRUNCATE TABLE` before reloading each target table.
- Reports individual table load durations and total execution time.
- Implements basic error reporting with `TRY...CATCH`.

Main scripts:
- `scripts/bronze/ddl_bronze.sql`
- `scripts/bronze/proc_load_bronze.sql`

### 2. Silver Layer — Cleansed and Standardized Data

The Silver layer transforms raw data into a more consistent format for integration and analysis.

Implemented functionality:
- Creates six Silver tables.
- Removes leading and trailing spaces from customer names.
- Standardizes marital status, gender, product lines, and country values.
- Excludes customer records with missing customer IDs and retains the latest record per customer ID.
- Extracts product category and product keys from source values.
- Derives product end dates based on subsequent product versions.
- Converts order, shipping, and due dates into SQL date values and handles invalid date representations.
- Handles missing or invalid sales and price values.
- Removes the `NAS` prefix from applicable ERP customer identifiers and normalizes customer location identifiers.
- Records the warehouse insertion timestamp through the `dwh_create_date` default column.

Main scripts:
- `scripts/silver/ddl_silver.sql`
- `scripts/silver/proc_load_silver.sql`

### 3. Gold Layer — Analytical Data Model

The Gold layer exposes integrated, business-oriented views based on the transformed Silver data.

Implemented views:

| View | Purpose |
|---|---|
| `gold.dim_customers` | Customer attributes, country, gender, marital status, and birthdate |
| `gold.dim_products` | Product attributes, categories, costs, and current product versions |
| `gold.fact_sales` | Sales transactions linked to customer and product dimension keys |

The model follows a Star Schema approach, with a sales fact view connected to customer and product dimensions.

The views use SQL joins to integrate CRM and ERP data and provide a consistent structure for future analytical queries and reporting.

Main script:
- `scripts/gold/ddl_gold.sql`

## Getting Started

### Prerequisites

- Microsoft SQL Server.
- SQL Server Management Studio (SSMS) or another compatible SQL client.
- Access to the project CSV files.
- Appropriate SQL Server permissions to create database objects and import files.

### Execution Order

Run the scripts in the following order:

1. `scripts/init_database.sql` — initialize the database.
2. `scripts/bronze/ddl_bronze.sql` — create the Bronze tables.
3. `scripts/bronze/proc_load_bronze.sql` — create the Bronze loading procedure.
4. Execute `bronze.load_bronze` to import the source CSV files.
5. `scripts/silver/ddl_silver.sql` — create the Silver tables.
6. `scripts/silver/proc_load_silver.sql` — create the Silver loading procedure.
7. Execute `silver.load_silver` to transform and load the Silver data.
8. `scripts/gold/ddl_gold.sql` — create the Gold views.

The loading procedures must be created before they are executed. If a procedure script contains an `EXEC` statement before its `CREATE OR ALTER PROCEDURE` definition, execute the procedure separately after the definition has been created.

### Source File Paths

The Bronze loading procedure currently uses local Windows file paths to access the CSV files.

Before running the procedure, update the paths in `proc_load_bronze.sql` to match the location of the datasets on your machine. SQL Server must be able to access these files using the relevant service account permissions.

## Data Quality and Validation

Data quality checks are an important part of the development process.

Validation areas include:
- Missing customer identifiers.
- Duplicate customer records.
- Invalid or missing date values.
- Standardization of categorical values.
- Consistency of sales amounts, quantities, and prices.
- Unmatched customer and product references between the fact and dimension views.

These checks can be performed using SQL queries against the Bronze, Silver, and Gold layers. The Gold fact view uses `LEFT JOIN` operations, so unmatched dimension records can be identified by checking for missing dimension keys.

## Current Scope and Limitations

The current implementation focuses on building the data warehouse structure and its core loading and transformation processes.

The project currently includes:
- Database initialization.
- Bronze and Silver table creation.
- Bronze and Silver loading procedures.
- Gold customer and product dimension views.
- A Gold sales fact view.

Standalone automated test scripts, a separate documentation directory, dashboards, and a comprehensive collection of business analysis queries are not currently included in the repository.

The loading procedures use full reloads of their target tables rather than incremental loading. The Gold dimension keys are generated using `ROW_NUMBER()`, so their values are not guaranteed to remain stable if the underlying data or sort order changes.

## License and Attribution

This project is an educational and portfolio adaptation inspired by the Data Warehouse and Analytics Project by Data with Baraa.

The repository includes a `LICENSE` file containing MIT License terms and copyright notices for the original work and original modifications. Attribution for adapted material is retained where applicable.

Source datasets and other third-party materials remain subject to their respective licenses and usage terms.

For details, see the [`LICENSE`](LICENSE) file.

## Project Status

**Status: In progress**

The project will evolve as additional data quality checks, SQL analysis queries, and documentation are developed and validated.
