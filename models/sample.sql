select
    {{ dbt_utils.star(from=ref('stg_customer'), except=["name"]) }}
from {{ ref('stg_customer') }}