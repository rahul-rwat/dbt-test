
{{ config(materialized='table') }}

WITH gold AS (
    SELECT
        country,
        COUNT(DISTINCT customer_id) AS unique_customers,
        SUM(quantity * price) AS total_sales_value,
        COUNT(DISTINCT invoice) AS total_invoices
    FROM {{ ref('silver') }}
    GROUP BY country
)

SELECT * FROM gold;
