
{{ config(materialized='table') }}
select
  transaction_id,
  date_id               
  customer_id,                        
  product_id,                         
  store_key,                          
  quantity_sold,
  unit_cost,
  total_amount,
  derived_unit_price,
  normalized_payment_method,
  
from {{ ref('agg_sales') }}
