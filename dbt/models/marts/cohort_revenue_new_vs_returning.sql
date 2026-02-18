{{ config(materialized='table') }}

select
  ufo.cohort_month,
  case when r.order_rank = 1 then 'new' else 'returning' end as revenue_type,
  sum(oi.sale_price) as revenue
from {{ ref('int_user_orders_ranked') }} r
join {{ ref('int_user_first_order') }} ufo using (user_id)
join {{ ref('stg_order_items') }} oi using (order_id)
group by ufo.cohort_month, revenue_type
