SELECT
    {% for aircraft in important_aircrafts %}
    SUM(CASE WHEN aircraft_id = '{{ aircraft }}' THEN 1 ELSE 0 END) as flights_{{aircraft|title|replace('73','oo')}}
        {%- if not loop['last'] %},{% endif %}
        -- {{ loop.cycle('-', '+') }}
    {%- endfor %}
FROM
    {{ ref('fct_flights') }}