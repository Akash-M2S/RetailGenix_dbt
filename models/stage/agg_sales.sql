-- agg_sales.sql

with base as (
  select * from {{ ref('int_sales') }}
)

select
  transaction_id,
  product_id,
  customer_id,
  product_name,
  product_category,
  date_id,
  quantity_sold,
  unit_cost,
  total_amount,

  -- Normalize payment method
  case
    when lower(payment_method) like '%card%' then 'CARD'
    when lower(payment_method) like '%cash%' then 'CASH'
    when lower(payment_method) like '%upi%' then 'UPI'
    else 'OTHER'
  end as normalized_payment_method,

  store_id,
  store_name,
  region,
  store_type,

  ---Derive month, key, unit price
  date_trunc('month', date_id) as sales_month,
  concat(store_id, '_', store_type) as store_key,
  round(total_amount / nullif(quantity_sold, 0), 2) as derived_unit_price
from base
where quantity_sold > 0
