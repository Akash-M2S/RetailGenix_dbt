select distinct
  product_id,
  product_name,
  product_category
from {{ ref('agg_sales') }}
where product_id is not null
