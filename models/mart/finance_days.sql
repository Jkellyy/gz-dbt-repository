--Date
--Total number of transactions
--Total revenue
--Avereage Basket
--Operational Margin
--Total purchase cost
--Total shipping fees
--Total log costs
--Total quantity of products sold.

{{ config(materialized='table')}}

SELECT date_date
    ,ROUND(SUM(revenue),2) as tot_revenue
    ,COUNT(orders_id) as nb_transaction
    ,ROUND(SUM(operational_margin),2) as operational_margin
    ,ROUND(SUM(purchase_cost),2) as tot_purchase_cost
    ,ROUND(SUM(shipping_fee),2) as tot_shipping_fee
    ,ROUND(SUM(logcost),2) AS tot_logcost
    ,ROUND(SUM(quantity),2) AS prod_sold
    ,ROUND(SUM(revenue)/(COUNT(orders_id)),2) AS average_basket
    ,ROUND(SUM(margin),0) AS margin
 --   ,ROUND(SUM(ship_cost),0) AS ship_cost
FROM {{ref("int_orders_operational")}}
GROUP BY date_date
ORDER BY date_date DESC

