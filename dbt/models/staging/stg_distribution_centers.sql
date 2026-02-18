{{ config(materialized='view') }}

select
  id as distribution_center_id,
  name,
  latitude,
  longitude
from {{ source('thelook_ecommerce', 'distribution_centers') }}
