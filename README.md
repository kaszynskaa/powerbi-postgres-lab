# Power BI + PostgreSQL Sales Dashboard Lab

A learning project connecting a PostgreSQL database to a Power BI report with a DAX measure and interactive filters.

## Stack

| Layer | Tool |
|---|---|
| Database | PostgreSQL |
| Reporting | Power BI Desktop |
| Query language | SQL |
| Measure language | DAX |

## Database schema

Single table `sales` in the `public` schema:

```sql
CREATE TABLE sales (
    id          SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category     VARCHAR(50),
    sale_date    DATE,
    quantity     INTEGER,
    unit_price   NUMERIC(10,2)
);
```

Sample data covers four products across two categories (`Electronics`, `Accessories`) with sale dates in June 2026.

## DAX measures

```dax
Revenue = SUMX('public sales', 'public sales'[quantity] * 'public sales'[unit_price])
```

## Power BI report (`powerbi/sales_dashboard.pbix`)

| Visual | Description |
|---|---|
| Revenue by sale_date | Time-series of daily revenue |
| Revenue by category | Breakdown by product category |
| Revenue by product_name | Per-product revenue comparison |

Active filter slicer: **category**

## Getting started

1. **Provision the database** — run the SQL scripts in order:
   ```
   sql/create_tables.sql   → create the sales table
   sql/insert_data.sql     → load sample rows
   sql/update_data.sql     → apply example update
   sql/select_data.sql     → verify data
   ```

2. **Connect Power BI** — open `powerbi/sales_dashboard.pbix`, update the PostgreSQL data source to point to your server/database, then refresh.

## Project layout

```
powerbi-postgres-lab/
├── dax/
│   └── measures.dax          # DAX measure definitions
├── docs/
│   └── opis_projektu.md      # Project notes (Polish)
├── powerbi/
│   └── sales_dashboard.pbix  # Power BI report file
└── sql/
    ├── create_tables.sql
    ├── insert_data.sql
    ├── select_data.sql
    └── update_data.sql
```
