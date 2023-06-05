select r.identifier, r.name, r.address, sum(o.amount) as turnover
from {{ ref("base_restaurants") }} as r
inner join {{ ref("base_orders") }} as o on r.identifier = o.restaurant_identifier
group by r.identifier, r.name, r.address
