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
    flight_id, 
    fare_conditions, 
    amount
from
    {{ ref('stg_fligths__ticket_flights') }}