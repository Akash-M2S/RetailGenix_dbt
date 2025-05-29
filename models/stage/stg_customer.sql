
with source as (
  select * from {{ source('raw_data', 'customer') }}
),

transformed as (
  select
    CUSTOMERID as customer_id,
    trim(NAME) as name,
    upper(trim(GENDER)) as gender,
    {{ clean_sales_column("PHONE", "phone") }} as cleaned_phone, --regexp_replace(PHONE, '[^0-9]', '') as cleaned_phone,
    trim(ADDRESS) as address,
    from source
  where upper(trim(GENDER)) in ('MALE', 'FEMALE', 'OTHERS')
),

handle_nulls as (
  select
    customer_id,              
    coalesce(name, 'Unknown') as name,
    coalesce(gender, 'OTHERS') as gender,
    coalesce(cleaned_phone, '0000000000') as phone,  -- default phone number
    coalesce(address, 'Unknown') as address,
  from transformed
),

deduplicated as (
  select distinct * from handle_nulls
)

select * from deduplicated
