 {% macro margin_percent(revenue, purchase_cost, margin) %}
 --    revenue - purchase cost AS margin,
     ROUND(SAFE_DIVIDE(revenue - purchase_cost, revenue),2)
 {% endmacro %}