{% macro get_payment_methods() %}

{% set payment_methods_query %}
select distinct payment_method from {{ ref("stg_restaurants__turnover") }}
{% endset %}

{% set results = run_query(payment_methods_query) %}

{% if execute %}
{# Return the first column #}
{% set payment_methods_list = results.columns[0].values() %}
{% else %}
{% set payment_methods_list = [] %}
{% endif %}

{{ return(payment_methods_list) }}

{% endmacro %}