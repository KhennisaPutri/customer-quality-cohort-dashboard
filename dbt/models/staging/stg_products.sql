{{ config(materialized='view') }}

select
  id as product_id,
  category,
  brand,
  retail_price
from {{ source('thelook_ecommerce', 'products') }}
