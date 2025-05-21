select distinct
  product_id,
  product_name,
  product_category
from {{ ref('stg_sale') }}
where product_id is not null
