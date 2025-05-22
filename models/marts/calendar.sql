{{ config(materialized='table') }}

select distinct
  date_id,
  extract(year from date_id) as year,
  extract(month from date_id) as month,
  extract(day from date_id) as day,
  extract(quarter from date_id) as quarter,
  extract(dow from date_id) as day_of_week,
--   to_char(date_id, 'Month') as month_name,
--   to_char(date_id, 'Day') as day_name
from {{ ref('agg_sales') }}
where date_id is not null
