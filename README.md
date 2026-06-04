# Snowflake dbt Logistics Analytics Engineering Project

## Project Overview

This project demonstrates a production-style analytics engineering workflow using **dbt Core** and **Snowflake**.

It uses Snowflake's built-in TPCH sample dataset to simulate a logistics and order analytics environment. The project transforms raw source tables into cleaned staging views, an intermediate enriched order-line model, and a reporting-ready star schema for revenue, customer, supplier, product, geography, and shipment performance analytics.

## Tech Stack

* Snowflake
* dbt Core
* dbt-snowflake adapter
* SQL
* Data quality tests
* dbt documentation and lineage
* Git/GitHub

## Architecture

The project follows a layered analytics engineering pattern:

```text
SNOWFLAKE_SAMPLE_DATA.TPCH_SF1
        ↓
Staging Models
        ↓
Intermediate Model
        ↓
Mart / Gold Models
```

## Model Layers

### Sources

The project uses the following Snowflake TPCH sample tables:

* CUSTOMER
* ORDERS
* LINEITEM
* SUPPLIER
* PART
* PARTSUPP
* NATION
* REGION

### Staging Layer

Staging models clean and rename raw TPCH columns into analytics-friendly field names.

Examples:

* `stg_tpch__customers`
* `stg_tpch__orders`
* `stg_tpch__line_items`
* `stg_tpch__suppliers`
* `stg_tpch__parts`
* `stg_tpch__part_suppliers`
* `stg_tpch__nations`
* `stg_tpch__regions`

### Intermediate Layer

The intermediate model combines order headers and line items into an enriched order-line dataset:

* `int_order_line_items`

This layer calculates shipping and revenue metrics including:

* Days to ship
* Days from ship to receipt
* Days from order to receipt
* Late shipment flag
* Net item revenue
* Gross item revenue

### Mart Layer

The mart layer creates a reporting-ready star schema.

Fact table:

* `fct_order_line_items`

Dimension tables:

* `dim_customers`
* `dim_suppliers`
* `dim_parts`
* `dim_geography`

## Final Star Schema

```text
fct_order_line_items
    ├── dim_customers
    ├── dim_suppliers
    ├── dim_parts
    └── dim_geography
```

## Data Quality

This project includes dbt data tests across staging, intermediate, and mart layers.

Test examples:

* Unique primary keys
* Not-null checks
* Accepted value checks
* Surrogate key uniqueness
* Required date and revenue fields

Current successful build result:

```text
Done. PASS=96 WARN=0 ERROR=0 SKIP=0 NO-OP=0 TOTAL=96
```

## Key Business Metrics Supported

This model supports analysis of:

* Order revenue
* Gross and net sales
* Late shipments
* Shipping performance
* Customer segmentation
* Supplier performance
* Product/part performance
* Regional performance

## Example dbt Commands

Run all models and tests:

```bash
dbt build
```

Run only staging models:

```bash
dbt run --select staging
```

Run only mart models:

```bash
dbt run --select marts
```

Run tests:

```bash
dbt test
```

Generate documentation:

```bash
dbt docs generate
```

Serve documentation locally:

```bash
dbt docs serve
```

## Project Outcome

This project demonstrates practical analytics engineering skills including:

* dbt project structure
* Snowflake modelling
* Source definitions
* Staging models
* Intermediate transformations
* Fact and dimension modelling
* Star schema design
* Data quality testing
* dbt documentation
* Lineage generation

## Author

Mohsin Mukhtiar
