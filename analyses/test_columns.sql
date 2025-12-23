{%- set cols = adapter.get_columns_in_relation(ref("stg_fligths__seats")) | map(attribute='name') | list -%}

select
    {{ cols | join(', ') }}
from {{ ref("stg_fligths__seats") }}
