{{ config(materialized='table') }}

select
  user_id,
  min(created_at) as first_order_at,
  format_date('%Y-%m', date(min(created_at))) as cohort_month
from {{ ref('stg_orders') }}
group by user_id
