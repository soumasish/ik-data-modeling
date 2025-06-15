SELECT 
    dp.market_id,
    dp.city,
    COUNT(*) as total_bookings,
    AVG(b.overall_satisfaction_score) as avg_satisfaction,
    AVG(b.cleanliness_score) as avg_cleanliness,
    AVG(b.communication_score) as avg_communication,
    SUM(b.issue_reported) as total_issues
FROM bookings b
JOIN dim_property dp ON b.property_id = dp.property_id AND dp.is_current = 1
GROUP BY dp.market_id, dp.city
ORDER BY avg_satisfaction DESC;

-- Guest satifaction over time 

SELECT 
    strftime('%Y-%m', b.booking_date) as booking_month,
    COUNT(*) as total_bookings,
    AVG(b.overall_satisfaction_score) as avg_satisfaction,
    COUNT(CASE WHEN b.issue_reported = 1 THEN 1 END) as issues_reported,
    ROUND(COUNT(CASE WHEN b.issue_reported = 1 THEN 1 END) * 100.0 / COUNT(*), 2) as issue_rate_pct
FROM bookings b
GROUP BY strftime('%Y-%m', b.booking_date)
ORDER BY booking_month;