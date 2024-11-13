
--SELECT *,
--   EXTRACT(MONTH from date_date) AS date_month
--     date_trunc(date_date, MONTH) AS datemonth
--FROM {{ref('finance_campaigns_day')}}
--GROUP BY EXTRACT(MONTH from date_date)
--GROUP BY datemonth

SELECT
    DATE_TRUNC(CAST(date_date AS DATE), MONTH) AS month_column,
    ROUND(AVG(ads_margin),2) AS avg_ads_margin,
    ROUND(AVG(average_basket),2) AS avg_average_basket,
    ROUND(AVG(operational_margin),2) AS avg_operational_margin,
    SUM(ads_cost) AS total_ads_cost,
    SUM(ads_impressions) AS total_ads_impression,
    SUM(ads_clicks) AS total_ads_clicks,
    SUM(prod_sold) AS total_quantity,
    SUM(tot_revenue) AS total_revenue,
    SUM(tot_purchase_cost) AS total_purchase_cost,
    SUM(margin) AS total_margin,
    SUM(tot_shipping_fee) AS total_shipping_fee,
    SUM(tot_logcost) AS total_logcost,
 --   SUM(ship_cost) AS total_ship_cost
FROM {{ref("finance_campaigns_day")}}
GROUP BY month_column
ORDER BY month_column DESC







