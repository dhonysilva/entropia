with raw_hosts AS (
    select * from {{ source('airbnb', 'hosts') }}
)

select
    id AS host_id,
    name AS host_name,
    is_superhost,
    created_at,
    updated_at
from
    raw_hosts
