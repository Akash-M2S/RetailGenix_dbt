select distinct
  store_key,
  store_id,
  store_name,
  region,
  store_type
from {{ ref('agg_sales') }}
where store_id is not null
