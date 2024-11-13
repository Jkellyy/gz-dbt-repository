-- Operational_margin = margin + shipping_fee - log_cost - ship_cost

SELECT
    int_orders_margin.orders_id
    ,int_orders_margin.date_date
    ,ROUND((SUM(margin) + SUM(shipping_fee) - SUM(logcost) - SUM(ship_cost)),2) AS operational_margin
    ,SUM(quantity) AS quantity
    ,SUM(revenue) AS revenue
    ,SUM(purchase_cost) AS purchase_cost
    ,SUM(logcost) AS logcost
    ,SUM(shipping_fee) AS shipping_fee
    ,SUM(margin) AS margin
    ,SUM(ship_cost) AS ship_cost
FROM {{ref("int_orders_margin")}}
LEFT JOIN {{ref("stg_raw__ship")}}
ON (int_orders_margin.orders_id=stg_raw__ship.orders_id)
GROUP BY int_orders_margin.orders_id, int_orders_margin.date_date