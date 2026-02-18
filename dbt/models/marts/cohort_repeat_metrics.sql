{{ config(materialized='table') }}

select
  cohort_month,
  countif(total_orders >= 2) / count(*) as repeat_purchase_rate,
  avg(days_to_second_purchase) as avg_days_to_second_purchase,
  avg(total_orders) as avg_orders_per_customer
from {{ ref('int_user_repeat_behavior') }}
group by cohort_month
