
{{ config(materialized='table') }}

WITH bronze AS (
    SELECT
        CAST(Invoice AS STRING) AS invoice,
        CAST(StockCode AS STRING) AS stock_code,
        CAST(Description AS STRING) AS description,
        CAST(Quantity AS INT) AS quantity,
        TO_TIMESTAMP(InvoiceDate, 'dd-MM-yyyy HH:mm') AS invoice_date,
        CAST(Price AS DECIMAL(10,2)) AS price,
        CAST(`Customer ID` AS STRING) AS customer_id,
        CAST(Country AS STRING) AS country
    FROM {{ source('dbt_rrawat', 'online_retail') }}

)

SELECT * FROM bronze;
