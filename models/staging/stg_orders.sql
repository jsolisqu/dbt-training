select  
ord.orderid,
ord.orderdate,
ord.shipdate,
ord.shipmode,
ord.ordersellingprice,
ord.ordercostprice,
ord.ordersellingprice - ord.ordercostprice as orderprofit,
c.customername,
c.segment,
c.country,
prod.category,
prod.productname,
prod.subcategory
from {{ ref('raw_orders') }} ord
left join {{ ref('raw_customer')}} c
on(ord.customerid=c.customerid)
left join {{ ref('raw_products')}} prod
on(ord.productid=prod.productid)
