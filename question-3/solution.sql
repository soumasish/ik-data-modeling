SELECT 
    g.country_name,
    g.region,
    COUNT(*) as total_conversions,
    COUNT(DISTINCT fc.user_id) as unique_converters,
    SUM(CASE WHEN fc.conversion_type = 'purchase' THEN 1 ELSE 0 END) as purchases,
    SUM(CASE WHEN fc.conversion_type = 'signup' THEN 1 ELSE 0 END) as signups,
    SUM(CASE WHEN fc.conversion_type = 'app_install' THEN 1 ELSE 0 END) as app_installs,
    SUM(fc.conversion_value) as total_revenue,
    AVG(fc.conversion_value) as avg_order_value,
    ROUND(SUM(fc.conversion_value) / COUNT(DISTINCT fc.user_id), 2) as revenue_per_user
FROM fact_ad_conversions fc
JOIN dim_geography g ON fc.country = g.country_code
GROUP BY g.country_name, g.region
ORDER BY total_revenue DESC;

-- Cost Per Conversion Analysis
-- campaign daily_budget is used as a proxy for actual spend.

WITH campaign_spend AS (
    -- Calculate estimated daily spend based on campaign budgets
    SELECT 
        c.campaign_id,
        c.campaign_name,
        c.daily_budget,
        -- Estimate total spend based on active days (simplified)
        CASE 
            WHEN c.end_date IS NULL THEN c.daily_budget * 5  -- 5 days in our sample data
            ELSE c.daily_budget * (julianday(c.end_date) - julianday(c.start_date) + 1)
        END as estimated_total_spend
    FROM dim_campaign c
),

conversion_metrics AS (
    -- Calculate conversion metrics by campaign
    SELECT 
        fc.campaign_id,
        COUNT(*) as total_conversions,
        COUNT(CASE WHEN fc.conversion_type = 'purchase' THEN 1 END) as purchase_conversions,
        COUNT(CASE WHEN fc.conversion_type = 'signup' THEN 1 END) as signup_conversions,
        COUNT(CASE WHEN fc.conversion_type = 'lead_form' THEN 1 END) as lead_conversions,
        SUM(fc.conversion_value) as total_revenue
    FROM fact_ad_conversions fc
    GROUP BY fc.campaign_id
)

SELECT 
    cs.campaign_name,
    cs.daily_budget,
    cs.estimated_total_spend,
    cm.total_conversions,
    cm.purchase_conversions,
    cm.signup_conversions,
    cm.lead_conversions,
    cm.total_revenue,
    -- Cost per conversion metrics
    ROUND(cs.estimated_total_spend / NULLIF(cm.total_conversions, 0), 2) as cost_per_conversion,
    ROUND(cs.estimated_total_spend / NULLIF(cm.purchase_conversions, 0), 2) as cost_per_purchase,
    ROUND(cs.estimated_total_spend / NULLIF(cm.signup_conversions, 0), 2) as cost_per_signup,
    ROUND(cs.estimated_total_spend / NULLIF(cm.lead_conversions, 0), 2) as cost_per_lead,
    -- Return on Ad Spend (ROAS)
    ROUND(cm.total_revenue / NULLIF(cs.estimated_total_spend, 0), 2) as roas
FROM campaign_spend cs
JOIN conversion_metrics cm ON cs.campaign_id = cm.campaign_id
ORDER BY cost_per_conversion;

