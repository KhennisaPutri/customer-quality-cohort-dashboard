{{ config(materialized='table') }}

select
  cohort_month,
  sum(lifetime_revenue) / count(user_id) as ltv_6_month
from {{ ref('int_user_lifecycle') }}
where second_purchase_month <= 6
   or second_purchase_month is null
group by cohort_month
