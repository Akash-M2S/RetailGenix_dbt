select *
from {{ ref('sales_fact') }}
where quantity_sold < 0