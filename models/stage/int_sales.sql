-- int_sales.sql

with base as (
  select * from {{ ref('stg_sale') }}
)

select
  transaction_id,
  product_id,
  customer_id,
  product_name,
  product_category,
  date_id,
  quantity_sold,
  round(unit_cost, 2) as unit_cost,         -- ✅ round here
  round(total_amount, 2) as total_amount,   -- ✅ round here
  PAYMENT_METHOD,
  store_id,
  store_name,
  region,
  store_type
from base
