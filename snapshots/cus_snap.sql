{% snapshot customers_snapshot %}

{{
    config(
        target_schema='snapshots',
        unique_key='CUSTOMER_ID',
        strategy='check',
        check_cols='CUSTOMER_NAME'

    )
}}

select *
from {{ source('raw', 'customers') }}

{% endsnapshot %}
