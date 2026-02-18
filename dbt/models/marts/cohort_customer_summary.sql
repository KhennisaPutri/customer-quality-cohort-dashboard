{{ config(materialized='table') }}

select
  cohort_month,
  count(*) as new_customers
from {{ ref('int_user_first_order') }}
group by cohort_month
