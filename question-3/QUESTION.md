# Question 3

You’re a data engineer at Instagram. You’re tasked to model your data warehouse to determine the conversion rates for ad campaigns. How would go about modeling your data?

## Schema

### Fact Table: fact_ad_conversions

Main fact table storing conversion events and performance metrics.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| conversion_id | TEXT | PRIMARY KEY | Unique identifier for each conversion |
| campaign_id | TEXT | NOT NULL, FOREIGN KEY | References dim_campaign.campaign_id |
| ad_id | TEXT | NOT NULL, FOREIGN KEY | References dim_ad.ad_id |
| user_id | TEXT | NOT NULL, FOREIGN KEY | References dim_user.user_id |
| conversion_date | DATE | NOT NULL | Date when conversion occurred |
| conversion_type | TEXT | NOT NULL, CHECK | Type of conversion (purchase, signup, app_install, add_to_cart, lead_form) |
| conversion_value | REAL | DEFAULT 0.0 | Monetary value of conversion |
| device_type | TEXT | CHECK | Device used (mobile, desktop, tablet) |
| placement | TEXT | CHECK | Ad placement (feed, stories, reels, explore) |
| age_group | TEXT | CHECK | User age group (18-24, 25-34, 35-44, 45-54, 55+) |
| gender | TEXT | CHECK | User gender (male, female, other) |
| country | TEXT | NOT NULL, FOREIGN KEY | References dim_geography.country_code |


### dim_campaign
Campaign-level information and settings.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| campaign_id | TEXT | PRIMARY KEY | Unique campaign identifier |
| campaign_name | TEXT | NOT NULL | Campaign display name |
| campaign_objective | TEXT | CHECK | Campaign goal (awareness, traffic, conversions, app_installs, lead_generation) |
| campaign_status | TEXT | CHECK, DEFAULT 'active' | Status (active, paused, completed) |
| start_date | DATE | NOT NULL | Campaign start date |
| end_date | DATE | | Campaign end date |
| daily_budget | REAL | | Daily spend limit |
| target_audience | TEXT | | Target audience description |

### dim_ad
Individual ad creative details.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| ad_id | TEXT | PRIMARY KEY | Unique ad identifier |
| ad_name | TEXT | NOT NULL | Ad display name |
| campaign_id | TEXT | NOT NULL, FOREIGN KEY | Parent campaign |
| creative_type | TEXT | CHECK | Creative format (image, video, carousel, collection) |
| ad_copy | TEXT | | Ad text content |
| call_to_action | TEXT | CHECK | CTA button (shop_now, learn_more, sign_up, download, contact_us) |
| created_date | DATE | NOT NULL | Ad creation date |
| status | TEXT | CHECK, DEFAULT 'active' | Ad status (active, paused, rejected) |

### dim_user
User profile and behavior data.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| user_id | TEXT | PRIMARY KEY | Unique user identifier |
| user_type | TEXT | CHECK | User category (new, returning, existing_customer) |
| signup_date | DATE | | User registration date |
| total_lifetime_value | REAL | DEFAULT 0.0 | Cumulative user value |
| previous_purchases | INTEGER | DEFAULT 0 | Historical purchase count |
| preferred_device | TEXT | CHECK | Primary device (mobile, desktop, tablet) |

### dim_geography
Geographic and regional information.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| country_code | TEXT | PRIMARY KEY | ISO country code |
| country_name | TEXT | NOT NULL | Full country name |
| region | TEXT | NOT NULL | Geographic region |
| timezone | TEXT | | Primary timezone |
| currency | TEXT | DEFAULT 'USD' | Local currency |

### dim_date
Date dimension for temporal analysis.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| date_key | INTEGER | PRIMARY KEY | Date in YYYYMMDD format |
| full_date | DATE | UNIQUE, NOT NULL | Full date value |
| year | INTEGER | NOT NULL | Year component |
| month | INTEGER | NOT NULL | Month component (1-12) |
| day | INTEGER | NOT NULL | Day component (1-31) |
| day_of_week | INTEGER | NOT NULL | Day of week (1=Sunday, 7=Saturday) |
| day_name | TEXT | NOT NULL | Full day name |
| is_weekend | INTEGER | NOT NULL, CHECK | Weekend flag (0=Weekday, 1=Weekend) |




## Sample Metrics

- Conversion Rate = Conversions / Impressions
- Cost Per Conversion = Ad Spend / Conversions
- Return on Ad Spend (ROAS) = Revenue / Ad Spend
- Average Order Value = Total Revenue / Purchase Conversions
- Customer Lifetime Value by segment