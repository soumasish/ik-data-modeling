# Question 2
Design a dimensional data model for Airbnb that focuses on analyzing customer satisfaction. Your model should enable the business to identify factors that impact guest experience across different properties, hosts, locations, and time periods.

## Schema

### Table: bookings

Fact table storing booking transactions and customer satisfaction metrics.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| booking_id | TEXT | PRIMARY KEY | Unique identifier for each booking |
| guest_id | TEXT | NOT NULL | References dim_guest.guest_id |
| host_id | TEXT | NOT NULL | References dim_host.host_id |
| property_id | TEXT | NOT NULL | References dim_property.property_id |
| booking_date | DATE | NOT NULL | Date when the booking was made |
| cleanliness_score | INTEGER | CHECK(cleanliness_score BETWEEN 1 AND 5) | Guest rating for property cleanliness (1-5 scale) |
| communication_score | INTEGER | CHECK(communication_score BETWEEN 1 AND 5) | Guest rating for host communication (1-5 scale) |
| overall_satisfaction_score | INTEGER | CHECK(overall_satisfaction_score BETWEEN 1 AND 5) | Overall guest satisfaction rating (1-5 scale) |
| review_text | TEXT | | Qualitative feedback from guest |
| issue_reported | INTEGER | CHECK(issue_reported IN (0, 1)), DEFAULT 0 | Flag indicating if guest reported any issues (0=No, 1=Yes) |

### Table: dim_guest

Guest dimension table with SCD Type 2 for tracking profile changes over time.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| dim_guest_id | INTEGER | PRIMARY KEY AUTOINCREMENT | Surrogate key for guest dimension |
| guest_id | TEXT | NOT NULL | Natural business key for guest |
| first_name | TEXT | NOT NULL | Guest's first name |
| last_name | TEXT | NOT NULL | Guest's last name |
| email | TEXT | NOT NULL | Guest's email address |
| mobile | TEXT | NOT NULL | Guest's mobile phone number |
| signup_date | DATE | NOT NULL | Date when guest first joined platform |
| start_date | DATE | NOT NULL | Effective start date for this record version |
| end_date | DATE | | Effective end date for this record version (NULL for current) |
| is_current | INTEGER | CHECK(is_current IN (0, 1)), DEFAULT 1 | Flag indicating current version (1=Current, 0=Historical) |

### Table: dim_host

Host dimension table with SCD Type 2 for tracking profile changes over time.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| dim_host_id | INTEGER | PRIMARY KEY AUTOINCREMENT | Surrogate key for host dimension |
| host_id | TEXT | NOT NULL | Natural business key for host |
| first_name | TEXT | NOT NULL | Host's first name |
| last_name | TEXT | NOT NULL | Host's last name |
| email | TEXT | NOT NULL | Host's email address |
| mobile | TEXT | NOT NULL | Host's mobile phone number |
| signup_date | DATE | NOT NULL | Date when host first joined platform |
| start_date | DATE | NOT NULL | Effective start date for this record version |
| end_date | DATE | | Effective end date for this record version (NULL for current) |
| is_current | INTEGER | CHECK(is_current IN (0, 1)), DEFAULT 1 | Flag indicating current version (1=Current, 0=Historical) |

### Table: dim_property

Property dimension table with SCD Type 2 for tracking location and market changes over time.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| dim_property_id | INTEGER | PRIMARY KEY AUTOINCREMENT | Surrogate key for property dimension |
| property_id | TEXT | NOT NULL | Natural business key for property |
| address | TEXT | NOT NULL | Property street address |
| city | TEXT | NOT NULL | City where property is located |
| state | TEXT | NOT NULL | State/province where property is located |
| country | TEXT | NOT NULL | Country where property is located |
| market_id | TEXT | NOT NULL | Business-defined market segment identifier |
| start_date | DATE | NOT NULL | Effective start date for this record version |
| end_date | DATE | | Effective end date for this record version (NULL for current) |
| is_current | INTEGER | CHECK(is_current IN (0, 1)), DEFAULT 1 | Flag indicating current version (1=Current, 0=Historical) |

