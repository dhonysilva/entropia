{{
  config(
    materialized = 'incremental',
    on_schema_change='fail'
    )
}}

with src_reviews AS (
  select * from {{ ref('src_reviews') }}
)

select * from src_reviews
where review_text is not null

-- It must be higher than the maximum date
{% if is_incremental() %}
  and review_date > (select max(review_date) from {{ this }})
{% endif %}
