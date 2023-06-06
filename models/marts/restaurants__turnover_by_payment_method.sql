select 
    identifier, name, address,
    {% for payment_method in get_payment_methods() %}
    sum(case when payment_method = '{{payment_method}}' then turnover end) as {{payment_method}}{%if not loop.last%},{%endif%}
    {% endfor %}
from {{ ref("stg_restaurants__turnover") }}
group by identifier, name, address
order by identifier asc
