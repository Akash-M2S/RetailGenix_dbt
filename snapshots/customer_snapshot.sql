{% snapshot customers_snapshot %}
    {{
        config(
        target_schema='snapshots',   
        unique_key='customer_id',    
        strategy='check',            
        check_cols=['address', 'gender'] 
        )
    }}

    SELECT
    *
    FROM {{ source('raw_data', 'customer') }}

{% endsnapshot %}
