{{ config(materialized='view') }}

select
  id as inventory_item_id,
  product_id,
  product_distribution_center_id as distribution_center_id
from {{ source('thelook_ecommerce', 'inventory_items') }}
