{{ config(materialized='table') }}

select
  cohort_month,
  first_category as category,
  count(user_id) as customers
from {{ ref('int_user_first_order_detail') }}
group by cohort_month, category
