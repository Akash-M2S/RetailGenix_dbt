-- stg_sales.sql

with source as (
  select * from {{ source('raw_data', 'sale') }}
)

select
  TRANSACTION_ID as transaction_id,
  PRODUCT_ID as product_id,
  CUSTOMER_ID as customer_id,
  trim(PRODUCT_NAME) as product_name,
  PRODUCTCATEGORY as product_category,
  {{ clean_sales_column("date_id", "date") }} as date_id,
  QUANTITY_SOLD as quantity_sold,
  UNIT_COST,
  TOTAL_AMOUNT,
  PAYMENT_METHOD,
  STORE_ID as store_id,
  STORENAME as store_name,
  REGION as region,
  STORETYPE as store_type
from source
