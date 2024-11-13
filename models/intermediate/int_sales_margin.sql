 --Calcul de purchase cost en joignant sales et product dans une subquery
 --Calcul de margin ensuite 
 

WITH cal_purchasecost AS (
select *,
    (quantity*purchase_price) AS purchase_cost
from {{ref("stg_raw__sales")}}
LEFT JOIN {{ref("stg_raw__product")}}
ON (products_id=product_id)
)

SELECT *,
    (revenue-purchase_cost) AS margin,
    {{ margin_percent('total_revenue','total_purchase_cost')}} AS margin_percent
from cal_purchasecost

