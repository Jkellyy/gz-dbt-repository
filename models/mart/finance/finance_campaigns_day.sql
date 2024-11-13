-- Join the int_campaigns_day model with finance_days model from the previous unit.
--ads_margin = operational_margin - ads_cos
SELECT *
    ,ROUND((operational_margin - ads_cost),2) AS ads_margin
FROM {{ref("finance_days")}}
JOIN {{ref("int_campaigns_day")}}
USING (date_date)