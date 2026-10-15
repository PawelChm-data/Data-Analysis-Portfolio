# Data Warehouse and Analytics Project

## Overview

This project demonstrates the design and implementation of a modern data warehouse using **Microsoft SQL Server and T-SQL**.

The objective is to consolidate sales data from two source systems — CRM and ERP — into a centralized data warehouse. The data is processed through multiple layers to improve its quality, consistency, and usability for analytical reporting.

The project covers data ingestion, data cleansing, data integration, dimensional modeling, data quality validation, and SQL-based business analysis.

## Project Objectives

- Build a modern data warehouse using SQL Server.
- Integrate data from CRM and ERP source systems.
- Implement a Medallion Architecture consisting of Bronze, Silver, and Gold layers.
- Develop ETL processes to load, clean, transform, and prepare data.
- Apply data quality checks and validate the resulting datasets.
- Create a business-ready analytical data model.
- Use SQL to analyze customer behavior, product performance, and sales trends.
- Document the technical approach and analytical decisions.

## Technologies

- **Database:** Microsoft SQL Server
- **Query Language:** T-SQL
- **Data Sources:** CRM and ERP CSV files
- **Architecture:** Medallion Architecture
- **Data Modeling:** Fact and dimension tables; star schema
- **Version Control:** Git and GitHub

## Repository Structure

```text
Data-Analysis-Portfolio/
└── SQL/
    └── Projects/
        └── Data-Warehouse-Project/
            ├── README.md
            ├── datasets/
            │   ├── source_crm/
            │   └── source_erp/
            ├── scripts/
            │   ├── init_database.sql
            │   ├── bronze/
            │   ├── silver/
            │   └── gold/
            ├── tests/
            └── docs/
```

The repository structure separates source datasets, SQL scripts, data quality tests, and project documentation to make the implementation easier to navigate and maintain.

Only files that are permitted to be redistributed should be committed to the repository.

## Data Architecture

The project follows the **Medallion Architecture**, organizing data into three layers.

### 1. Bronze Layer — Raw Data

The Bronze layer stores data imported from the source systems with minimal transformation.

Responsibilities:
- Load CRM and ERP data from CSV files.
- Preserve the original source values.
- Establish a consistent structure for subsequent processing.
- Support data traceability and troubleshooting.

### 2. Silver Layer — Cleaned and Standardized Data

The Silver layer improves data quality and consistency.

Responsibilities:
- Identify and handle missing or invalid values.
- Standardize data formats and representations.
- Remove or resolve duplicates where appropriate.
- Validate data types and business rules.
- Prepare consistent datasets for integration.

### 3. Gold Layer — Business-Ready Data

The Gold layer contains data prepared for analytical queries and reporting.

Responsibilities:
- Integrate the processed CRM and ERP datasets.
- Build fact and dimension tables.
- Implement a star schema where appropriate.
- Support efficient business reporting and analytical queries.
- Provide consistent measures for sales and customer analysis.

## Data Warehouse Development

The project is organized around the following stages.

### 1. Database Initialization

Create the database and the schemas or objects required by the warehouse.

### 2. Data Ingestion

Load the source files into the Bronze layer using SQL Server.

### 3. Data Cleansing and Transformation

Process raw data in the Silver layer, applying data quality rules, standardization, and transformations.

### 4. Data Integration and Modeling

Combine the prepared datasets and develop the Gold layer, including fact and dimension tables.

### 5. Data Quality Validation

Use SQL queries to verify data completeness, consistency, uniqueness, and referential integrity.

### 6. Business Analysis

Use the final analytical model to answer business questions and calculate relevant performance metrics.

## Project Requirements

### Data Engineering

**Objective:** Develop a centralized data warehouse that consolidates sales data from CRM and ERP systems.

Specifications:
- Import data from the provided CRM and ERP source files.
- Clean and standardize data before analytical use.
- Integrate related entities into a consistent data model.
- Focus on the latest available dataset; historical historization is outside the initial scope.
- Document the data model, transformations, and data quality rules.
- Organize SQL scripts into logical, reusable stages.

### Analytics and Reporting

**Objective:** Use SQL to derive business insights from the Gold layer.

Areas of analysis:
- **Customer Behavior:** Customer activity, purchasing patterns, and customer-level metrics.
- **Product Performance:** Product sales, demand, and contribution to overall sales.
- **Sales Trends:** Revenue trends, monthly performance, and period-over-period comparisons where the available data supports them.

The analysis should connect query results to clear business questions and explain the significance of the findings.

## Data Quality and Testing

Data quality is an essential part of the implementation.

Potential validation checks include:
- Missing values in required columns.
- Duplicate business keys.
- Invalid data types or inconsistent formats.
- Unmatched customer, product, or employee references.
- Unexpected sales or quantity values.
- Consistency between source data and transformed datasets.

The checks should be implemented as SQL queries and documented alongside the relevant scripts.

## Documentation

Project documentation focuses on the implementation itself rather than supplementary learning materials.

It may include:
- Project scope and objectives.
- Data source descriptions.
- Transformation rules and assumptions.
- Data model and table descriptions.
- Data quality checks.
- Analytical queries and business findings.

## Project Status

**Status:** In progress

This repository will be updated as the data warehouse, transformation scripts, validation checks, and analytical queries are developed and tested.

## License and Attribution

This project is intended for educational and portfolio purposes.

The project concept and learning approach are inspired by the Data Warehouse and Analytics Project by Data with Baraa. Original source materials, videos, and graphics are not included in this repository.

Any datasets, code, or other materials redistributed with the project must comply with their respective licenses and usage terms.
