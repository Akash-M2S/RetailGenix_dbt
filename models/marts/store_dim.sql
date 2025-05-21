select distinct
  store_key,
  store_id,
  store_name,
  region,
  store_type
from {{ ref('stg_sale') }}
where store_id is not null
