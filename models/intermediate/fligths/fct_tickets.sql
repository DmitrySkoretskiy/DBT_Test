{{
  config(
    materialized = 'table',
    meta = {
      'owner': 'sql_file_owner@Dima_gmail.com'
    }
    )
}}
select
    ticket_no, 
    book_ref, 
    passenger_id, 
    passenger_name, 
    contact_data
from
    {{ ref('stg_fligths__tickets') }} sft
    where 
      sft.passenger_id not in
      (
        select passenger_id
        from {{ ref('staff') }}
      )