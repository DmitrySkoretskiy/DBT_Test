{% set statuses = ['Departed', 'Arrived' 'Cancelled', 'Delayed', 'Scheduled'] %}

select
    departure_airport_id,
    {{ dbt_utils.pivot(
        'status',
        statuses,
        quote_identifiers=False
    ) }}
from 
    {{ ref('fct_flights') }}
group by departure_airport_id
