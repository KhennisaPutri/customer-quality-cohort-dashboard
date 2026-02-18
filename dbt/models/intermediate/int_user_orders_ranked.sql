{{ config(materialized='view') }}

select
  o.user_id,
  o.order_id,
  o.created_at,
  row_number() over (
    partition by o.user_id
    order by o.created_at
  ) as order_rank
from {{ ref('stg_orders') }} o
