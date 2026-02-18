{{ config(materialized='table') }}

with user_category_counts as (

  select
    user_id,
    cohort_month,
    count(distinct category) as category_count
  from {{ ref('int_orders_enriched') }}
  group by
    user_id,
    cohort_month

)

select
  cohort_month,
  countif(category_count > 1) / count(*) as category_expansion_rate
from user_category_counts
group by cohort_month
