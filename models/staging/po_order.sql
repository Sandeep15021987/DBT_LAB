

SELECT
    order_id,
    customer_id,
     amount,
    UPDATED_AT
FROM {{ source('raw', 'po_orders') }}
