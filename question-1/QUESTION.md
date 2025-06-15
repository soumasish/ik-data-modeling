# Question 1

Design a data model for Lyft to understand driver earnings. As our platform scales we need to analyze driver earnings across various dimensions. 
Model your data to support two dashboards:
1. Daily driver earnings by location
2. Daily driver earnings by vehicle make

## Schema

### Table: rides

Main transaction table storing ride details and financial information.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| ride_id | TEXT | PRIMARY KEY | Unique identifier for each ride |
| driver_id | TEXT | NOT NULL, FOREIGN KEY | References drivers.driver_id |
| start_time | DATETIME | NOT NULL | When the ride started |
| end_time | DATETIME | NOT NULL | When the ride ended |
| base_amount | REAL | NOT NULL | Base fare for the ride |
| wait_amount | REAL | DEFAULT 0.0 | Additional fee for waiting time |
| distance_pay | REAL | NOT NULL | Payment based on distance traveled |
| tip_amount | REAL | DEFAULT 0.0 | Tip given by passenger |
| platform_fee | REAL | NOT NULL | Fee charged by the platform |
| tax_deduction | REAL | DEFAULT 0.0 | Tax amount deducted from earnings |

### Table: drivers

Driver profile and vehicle information.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| driver_id | TEXT | PRIMARY KEY | Unique identifier for each driver |
| first_name | TEXT | NOT NULL | Driver's first name |
| last_name | TEXT | NOT NULL | Driver's last name |
| email | TEXT | UNIQUE, NOT NULL | Driver's email address |
| phone | TEXT | NOT NULL | Driver's phone number |
| license_number | TEXT | UNIQUE, NOT NULL | Driver's license number |
| vehicle_make | TEXT | NOT NULL | Vehicle manufacturer |
| vehicle_model | TEXT | NOT NULL | Vehicle model |
| vehicle_year | INTEGER | NOT NULL | Vehicle year |
| license_plate | TEXT | UNIQUE, NOT NULL | Vehicle license plate |
| rating | REAL | DEFAULT 0.0 | Average driver rating |
| total_rides | INTEGER | DEFAULT 0 | Total number of rides completed |
| join_date | DATE | NOT NULL | Date when driver joined platform |
| status | TEXT | CHECK(status IN ('active', 'inactive', 'suspended')), DEFAULT 'active' | Current driver status |
| background_check_date | DATE | | Date of last background check |
| insurance_expiry | DATE | NOT NULL | Insurance expiration date |

### Table: dim_date

Date dimension table for time-based analytics.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| date_key | INTEGER | PRIMARY KEY | Date in YYYYMMDD format |
| full_date | DATE | UNIQUE, NOT NULL | Full date value |
| year | INTEGER | NOT NULL | Year component |
| month | INTEGER | NOT NULL | Month component (1-12) |
| day | INTEGER | NOT NULL | Day component (1-31) |
| day_of_week | INTEGER | NOT NULL | Day of week (0=Sunday, 6=Saturday) |
| day_name | TEXT | NOT NULL | Full day name |
| is_weekend | INTEGER | NOT NULL, CHECK(is_weekend IN (0, 1)) | 1 if weekend, 0 if weekday |

### Table: fee_structure

Configuration table for various fees and rates.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| fee_id | INTEGER | PRIMARY KEY AUTOINCREMENT | Unique identifier for fee structure |
| fee_type | TEXT | NOT NULL | Type of fee (platform_fee, booking_fee, etc.) |
| description | TEXT | NOT NULL | Human-readable description of the fee |
| calculation_method | TEXT | NOT NULL, CHECK(calculation_method IN ('percentage', 'flat_rate', 'per_mile')) | How the fee is calculated |
| rate | REAL | NOT NULL | The rate or amount for the fee |
| min_amount | REAL | DEFAULT 0.0 | Minimum fee amount |
| max_amount | REAL | DEFAULT NULL | Maximum fee amount (NULL = no limit) |
| effective_date | DATE | NOT NULL | Date when this fee structure became effective |
| is_active | INTEGER | NOT NULL, DEFAULT 1, CHECK(is_active IN (0, 1)) | Whether this fee structure is currently active |


