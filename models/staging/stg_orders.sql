

SELECT
    order_id,
    customer_id,
    order_date,
    amount
FROM {{ source('raw', 'orders') }}
{{ log("SOURCE DB = " ~ env_var('DBT_SOURCE_DATABASE'), info=true) }}