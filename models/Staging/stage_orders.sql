--select *, ORDERSELLINGPRICE - ORDERCOSTPRICE as profit
--from 
--{{ ref('raw_orders') }}


--select *, ORDERSELLINGPRICE - ORDERCOSTPRICE as profit
--from 
--GLOBALMART.Global_transform.raw_orders

select
--from raw_orders
orderid,
orderdate,
shipdate,
shipmode,
o.customerid,
o.productid,
ordersellingprice,
ordercostprice,
--from raw_customer
customername,
segment,
country,
--from raw_product
category,
productname,
subcategory,
ordersellingprice - ordercostprice as orderprofit from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c
on o.customerid = c.customerid
left join {{ ref('raw_products') }} as p
on o.productid = p.productid