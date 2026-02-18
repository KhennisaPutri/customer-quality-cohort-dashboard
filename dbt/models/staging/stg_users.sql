{{ config(materialized='view') }}

select
  id as user_id,
  country,
  state,
  city
from {{ source('thelook_ecommerce', 'users') }}
