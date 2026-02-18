{{ config(materialized='table') }}

select
  ufo.user_id,
  ufo.cohort_month,
  count(distinct o.order_id) as total_orders,
  min(case when r.order_rank = 2 then date(o.created_at) end)
    as second_order_date,
  date_diff(
    min(case when r.order_rank = 2 then date(o.created_at) end),
    date(ufo.first_order_at),
    day
  ) as days_to_second_purchase
from {{ ref('int_user_first_order') }} ufo
join {{ ref('int_user_orders_ranked') }} r using (user_id)
join {{ ref('stg_orders') }} o using (order_id)
group by ufo.user_id, ufo.cohort_month, ufo.first_order_at
