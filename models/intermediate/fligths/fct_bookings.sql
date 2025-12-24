{{
  config(
    materialized = 'table',
    meta = {
      'owner': 'dima_file_owner@gmail.com'
    }
    )
}}
select
  {{- show_columns_relation('stg_fligths__bookings') -}}
from
    {{ ref('stg_fligths__bookings') }}