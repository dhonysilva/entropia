# Data Modeling - Airbnb Listings and Reviews

## Tables and Relationships

### Table: `listings`


| Column | Type | Description |
|-------|------|-----------|
| id | integer | Unique Identifier (PK) |
| listing_url | string | Listing URL |
| name | string | Listing name |
| room_type | string | Room Type |
| minimum_nights | integer | Minimum Nights number |
| host_id | integer | Host ID (FK → hosts) |
| price | string | Price |
| created_at | timestamp | Creation date |
| updated_at | timestamp | Update date |

---

### Table: `reviews`


| Column | Type | Description |
|-------|------|-----------|
| listing_id | integer | Listing ID (FK → listings) |
| date | datetime | Review date |
| reviewer_name | string | Reviewer Name |
| comments | string | Comments |
| sentiment | string | Review Sentiment |

---

### Table: `hosts`


| Column | Type | Description |
|-------|------|-----------|
| id | integer | Unique Identifier  (PK) |
| name | string | Host Name |
| host_is_superhost | string | Is superhost or not |
| created_at | timestamp | Creation date |
| updated_at | timestamp | Update date |

---

### Table: `full_moon_dates`

| Column | Type | Description |
|-------|------|-----------|
| full_moon_date | datetime | Full Moon Date |

---

## Relationships

```mermaid
erDiagram
    hosts ||--o{ listings : "1:N - Um host pode ter várias listagens"
    listings ||--o{ reviews : "1:N - Uma listagem pode ter várias reviews"

    hosts {
        integer id PK "Unique Identifier"
        string name "Host Name"
        integer host_is_superhost "0=No, 1=Yes"
        timestamp created_at "Creation date"
        timestamp updated_at "Update date"
    }

    listings {
        integer id PK "Unique Identifier"
        string listing_url "Listing URL"
        string name "Listing Name"
        string room_type "Room Type"
        integer minimum_nights "Minimum Nights number"
        integer host_id FK "Host ID"
        string price "Price"
        timestamp created_at "Creation date"
        timestamp updated_at "Update date"
    }

    reviews {
        integer listing_id FK "Listing ID"
        datetime date "Review date"
        string reviewer_name "Reviewer Name"
        string comments "Comments"
        string sentiment "Review Sentiment"
    }

    full_moon_dates {
        datetime full_moon_date "Full Moon Date"
    }
```

### Relationships descriptions:

1. **hosts → listings**: A host can have multiple listings (1:N)
   - Foreign key: `listings.host_id` references `hosts.id`

2. **listings → reviews**: A listing can have multiple reviews (1:N)
   - Foreign key: `reviews.listing_id` references `listings.id`

3. **full_moon_dates**: Independent table with no direct relationships

---
