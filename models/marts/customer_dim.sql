{{ config(
    materialized='incremental',
    unique_key='id'
) }}

SELECT
   distinct
  customer_id,
  name,
  gender,
  phone,
  address
FROM  {{ ref('stg_customer') }}
{% if is_incremental() %}
WHERE customer_id NOT IN (SELECT id FROM {{ this }})
{% endif %}

