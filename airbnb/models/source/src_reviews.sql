with raw_reviews as (
    select * from AIRBNB.RAW.RAW_REVIEWS
)
select
	listing_id,
    date AS review_date,
    reviewer_name,
    comments AS review_text,
    sentiment AS review_sentiment
from
    raw_reviews
