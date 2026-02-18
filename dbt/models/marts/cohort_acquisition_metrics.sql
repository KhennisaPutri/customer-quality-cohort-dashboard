{{ config(materialized='table') }}

select
  cohort_month,
  count(*) as new_customers,
  avg(first_order_revenue) as first_order_aov
from {{ ref('int_user_first_order_detail') }}
group by cohort_month
