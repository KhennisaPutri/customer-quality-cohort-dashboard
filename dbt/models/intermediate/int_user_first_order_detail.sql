{{ config(materialized='table') }}

-- 1. First order per user
with first_orders as (

  select
    r.user_id,
    r.order_id,
    ufo.cohort_month
  from {{ ref('int_user_orders_ranked') }} r
  join {{ ref('int_user_first_order') }} ufo
    on r.user_id = ufo.user_id
  where r.order_rank = 1

),

-- 2. First order revenue + category
first_order_agg as (

  select
    fo.user_id,
    fo.order_id,
    fo.cohort_month,
    sum(oi.sale_price) as first_order_revenue,
    any_value(p.category) as first_category
  from first_orders fo
  join {{ ref('stg_order_items') }} oi
    on fo.order_id = oi.order_id
  join {{ ref('stg_products') }} p
    on oi.product_id = p.product_id
  group by
    fo.user_id,
    fo.order_id,
    fo.cohort_month

)

-- 3. Attach user geography (SAFE)
select
  foa.user_id,
  foa.order_id,
  foa.cohort_month,
  foa.first_order_revenue,
  foa.first_category,
  u.country,
  u.state
from first_order_agg foa
left join {{ ref('stg_users') }} u
  on foa.user_id = u.user_id
