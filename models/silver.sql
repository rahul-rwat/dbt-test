{{ config(materialized='table') }}

WITH silver AS (
    SELECT
        invoice,
        stock_code,
        description,
        quantity,
        invoice_date,
        price,
        customer_id,
        country
    FROM {{ ref('bronze') }}
    WHERE customer_id IS NOT NULL
)

SELECT * FROM silver;
