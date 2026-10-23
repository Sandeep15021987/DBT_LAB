

SELECT
    order_id,
    customer_id,
    order_date,
    amount
FROM {{ source('raw', 'orders') }}
{{ log(
    "DBT_SOURCE_DATABASE = " ~ env_var('DBT_SOURCE_DATABASE'),
    info=true
) }}