SELECT
    aircraft_code,
    count(*) as seats_cnt
FROM
    {{ ref('stg_fligths__seats') }}
GROUP BY
    aircraft_code