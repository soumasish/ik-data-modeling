WITH base_earnings AS (
    -- Base CTE with ride-level earnings and derived location
    SELECT 
        r.ride_id,
        r.driver_id,
        CAST(strftime('%Y%m%d', r.start_time) AS INTEGER) as date_key,
        r.base_amount + r.distance_pay + r.wait_amount + r.tip_amount as gross_earnings,
        r.platform_fee + r.tax_deduction as total_deductions,
        (r.base_amount + r.distance_pay + r.wait_amount + r.tip_amount) - (r.platform_fee + r.tax_deduction) as net_earnings,
        r.tip_amount,
        d.vehicle_make,
        -- Derive location from ride patterns (mock logic)
        CASE 
            WHEN CAST(substr(r.ride_id, 2) AS INTEGER) % 4 = 0 THEN 'Downtown'
            WHEN CAST(substr(r.ride_id, 2) AS INTEGER) % 4 = 1 THEN 'Airport'
            WHEN CAST(substr(r.ride_id, 2) AS INTEGER) % 4 = 2 THEN 'Suburbs'
            ELSE 'Business District'
        END as location_zone
    FROM rides r
    JOIN drivers d ON r.driver_id = d.driver_id
),

daily_earnings_by_location AS (
    SELECT 
        be.date_key,
        dd.full_date,
        dd.day_name,
        dd.is_weekend,
        be.location_zone,
        COUNT(*) as total_rides,
        COUNT(DISTINCT be.driver_id) as active_drivers,
        SUM(be.gross_earnings) as total_gross_earnings,
        SUM(be.net_earnings) as total_net_earnings,
        SUM(be.tip_amount) as total_tips,
        AVG(be.gross_earnings) as avg_ride_earnings,
        ROUND(SUM(be.net_earnings) / COUNT(DISTINCT be.driver_id), 2) as avg_driver_daily_earnings
    FROM base_earnings be
    JOIN dim_date dd ON be.date_key = dd.date_key
    GROUP BY be.date_key, dd.full_date, dd.day_name, dd.is_weekend, be.location_zone
),

daily_earnings_by_vehicle AS (
    SELECT 
        be.date_key,
        dd.full_date,
        dd.day_name,
        dd.is_weekend,
        be.vehicle_make,
        COUNT(*) as total_rides,
        COUNT(DISTINCT be.driver_id) as active_drivers,
        SUM(be.gross_earnings) as total_gross_earnings,
        SUM(be.net_earnings) as total_net_earnings,
        SUM(be.tip_amount) as total_tips,
        AVG(be.gross_earnings) as avg_ride_earnings,
        ROUND(SUM(be.net_earnings) / COUNT(DISTINCT be.driver_id), 2) as avg_driver_daily_earnings
    FROM base_earnings be
    JOIN dim_date dd ON be.date_key = dd.date_key
    GROUP BY be.date_key, dd.full_date, dd.day_name, dd.is_weekend, be.vehicle_make
)






