{{ config(materialized='table') }}

select
  user_id,
  cohort_month,

  count(distinct order_id) as total_orders,
  sum(sale_price) as lifetime_revenue,

  min(cohort_age_month) as first_active_month,
  min(case when cohort_age_month > 0 then cohort_age_month end)
    as second_purchase_month

from {{ ref('int_orders_enriched') }}
group by user_id, cohort_month
