{{ config(materialized='table') }}

select
  cohort_month,
  cohort_age_month,
  sum(sale_price) as cohort_revenue
from {{ ref('int_orders_enriched') }}
group by cohort_month, cohort_age_month
