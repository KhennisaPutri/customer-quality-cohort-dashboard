{{ config(materialized='view') }}

select
  id as order_item_id,
  order_id,
  product_id,
  sale_price
from {{ source('thelook_ecommerce', 'order_items') }}
