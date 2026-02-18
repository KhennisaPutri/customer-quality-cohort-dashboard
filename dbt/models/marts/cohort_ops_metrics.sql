{{ config(materialized='table') }}

select
  cohort_month,

  avg(
    date_diff(
      date(delivered_at),
      date(created_at),
      day
    )
  ) as avg_delivery_days,

  countif(returned_at is not null) / count(*) as return_rate

from {{ ref('int_orders_enriched') }}
group by cohort_month
