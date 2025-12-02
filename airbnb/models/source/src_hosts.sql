with raw_hosts AS (
    select * from AIRBNB.RAW.RAW_HOSTS
)

select
    id AS host_id,
    NAME AS host_name,
    is_superhost,
    created_at,
    updated_at
from
    raw_hosts
