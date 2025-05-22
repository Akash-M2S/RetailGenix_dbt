select *
from {{ ref('customer_dim') }}
where gender != 'MALE' and gender != 'FEMALE'
