{% snapshot customers_snapshot %}
{{
    config(
        target_schema='snapshots', 
        unique_key='CUSTOMERID',
        strategy='check',
        check_cols=['address', 'gender']
    )
}}

SELECT
    *
FROM {{ source('raw_data', 'customer') }}

{% endsnapshot %}
