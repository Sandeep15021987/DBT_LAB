{% snapshot customers_snapshot %}

{{
    config(
        unique_key='CUSTOMER_ID',
        strategy='check',
        check_cols=['CUSTOMER_NAME'],
        target_schema='snapshots'
    )
}}

select
    CUSTOMER_ID,
    CUSTOMER_NAME,
    email,
    city
from {{ source('raw', 'customers') }}

{% endsnapshot %}