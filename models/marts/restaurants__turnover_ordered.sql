select
    identifier,
    name,
    address,
    turnover,
    rank() over (order by turnover desc) as rank
from {{ ref('stg_restaurants__turnover') }}
qualify rank <= {{ var('nb_restaurants_to_show') }}
order by rank asc
