with source as (
  select * from {{ source('raw_data', 'sale') }}
),

transformed as (
  select
    TRANSACTION_ID as transaction_id,                      -- ✅ 7. Rename to snake_case
    PRODUCT_ID as product_id,
    CUSTOMER_ID as customer_id,
    trim(PRODUCT_NAME) as product_name,                    -- ✅ 8. Trim product name
    PRODUCTCATEGORY as product_category,
   {{ clean_sales_column("date_id", "date") }} as date_id, -- cleaned_dateDATE_ID as date_id,
    QUANTITY_SOLD as quantity_sold,
    round(UNIT_COST, 2) as unit_cost,                      -- ✅ 9. Round unit cost
    round(TOTAL_AMOUNT, 2) as total_amount,                -- ✅ 10. Round total amount

    -- ✅ 11. Normalize payment method
    case
      when lower(PAYMENT_METHOD) like '%card%' then 'CARD'
      when lower(PAYMENT_METHOD) like '%cash%' then 'CASH'
      when lower(PAYMENT_METHOD) like '%upi%' then 'UPI'
      else 'OTHER'
    end as normalized_payment_method,

    STORE_ID as store_id,
    STORENAME as store_name,
    REGION as region,
    STORETYPE as store_type,

    date_trunc('month', DATE_ID) as sales_month,           -- ✅ 12. Derive sales month
    concat(STORE_ID, '_', STORETYPE) as store_key,         -- ✅ 13. Create composite store key
    round(TOTAL_AMOUNT / nullif(QUANTITY_SOLD, 0), 2) 
        as derived_unit_price                              -- ✅ 14. Derived column (unit price)
  from source
  where QUANTITY_SOLD > 0                                  -- ✅ 15. Filter out invalid quantities
)
select * from transformed
