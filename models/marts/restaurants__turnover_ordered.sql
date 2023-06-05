select
    identifier,
    name,
    address,
    turnover,
    rank() over (order by turnover desc) as rank
from {{ ref('stg_restaurants__turnover') }}
order by rank asc
