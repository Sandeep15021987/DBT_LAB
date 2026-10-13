{{
    config(
        materialized='incremental',
        unique_key='ORDER_ID',
        incremental_strategy='merge'
    )
}}

SELECT
    ORDER_ID,
    CUSTOMER_ID,
    AMOUNT,
     UPDATED_AT
FROM {{ source('raw', 'po_orders') }}

{% if is_incremental() %}

WHERE UPDATED_AT > (
    SELECT COALESCE(
        MAX(UPDATED_AT),
        '1900-01-01'::TIMESTAMP_NTZ
    )
    FROM {{ this }}
)

{% endif %}