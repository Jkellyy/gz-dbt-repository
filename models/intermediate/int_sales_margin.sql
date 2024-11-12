select revenue,
    ,quantity
    ,purchase_price
from {{ref("stg_raw__sales")}}
JOIN {{ref("stg_raw__product")}}
using(product_id)