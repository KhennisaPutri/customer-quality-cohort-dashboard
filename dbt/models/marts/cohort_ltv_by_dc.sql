{{ config(materialized='table') }}

with user_dc_revenue as (

  select
    o.user_id,
    ufo.cohort_month,
    ii.distribution_center_id,
    sum(oi.sale_price) as revenue
  from {{ ref('stg_orders') }} o
  join {{ ref('int_user_first_order') }} ufo
    on o.user_id = ufo.user_id
  join {{ ref('stg_order_items') }} oi
    on o.order_id = oi.order_id
  join {{ ref('stg_inventory_items') }} ii
    on oi.product_id = ii.product_id
  group by
    o.user_id,
    ufo.cohort_month,
    ii.distribution_center_id

),

primary_dc_per_user as (

  select
    user_id,
    cohort_month,
    distribution_center_id
  from (
    select
      *,
      row_number() over (
        partition by user_id, cohort_month
        order by revenue desc
      ) as rn
    from user_dc_revenue
  )
  where rn = 1

),

user_lifetime_revenue as (

  select
    user_id,
    cohort_month,
    sum(sale_price) as lifetime_revenue
  from {{ ref('int_orders_enriched') }}
  group by
    user_id,
    cohort_month

)

select
  p.cohort_month,
  p.distribution_center_id,
  sum(u.lifetime_revenue) / count(distinct p.user_id) as ltv
from primary_dc_per_user p
join user_lifetime_revenue u
  on p.user_id = u.user_id
 and p.cohort_month = u.cohort_month
group by
  p.cohort_month,
  p.distribution_center_id
