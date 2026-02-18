{{ config(materialized='table') }}

select
  cohort_month,
  category,
  count(distinct user_id) as customers,
  sum(sale_price) as revenue
from {{ ref('int_orders_enriched') }}
group by cohort_month, category
