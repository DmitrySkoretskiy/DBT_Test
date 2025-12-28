{{
    config(
    severity = 'warn',
    )
}}
SELECT
    total_amount
FROM
    {{ ref('stg_fligths__bookings') }}
WHERE
    total_amount > 10000000
    OR total_amount <=0
