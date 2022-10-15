select * from "Cities" c 


select count(e."comercialName"), e."comercialName", to_char(oo."createdAt", 'yyyy-mm') as "Day"  from "OriginalOrders" oo 
left join "CSVHistorial" c on oo."csvHistorialID" = c.id 
left join "Enterprises" e on e.id = c."enterpriseID" 
where oo."cityID" = 2 
and oo.validated = false and oo.deleted =false and oo.errors is not null 
group by e."comercialName" , "Day"
order by "Day" desc


select to_char("createdAt", 'yyyy-mm-dd') as "Day", count(*) as "Total", 
count(distinct oo."orderInfoData" ->'trackCode' ) as "Trackcode"
from "OriginalOrders" oo where oo."cityID" = 2
and oo.validated = false and oo.deleted =false and oo.errors is not null
--and oo."createdAt" <= '2022-07-13'::date
group by "Day" order by "Day" desc

select oo.id   , oo."createdAt" , oo."orderInfoData" ->'trackCode'->>'value' as "Trackcode"
from "OriginalOrders" oo where oo."cityID" = 2
and oo.validated = false and oo.deleted =false and oo.errors is not null
and oo."createdAt" < '2022-08-17'::date
order by oo.id desc


update "OriginalOrders" set deleted = true where "cityID" = 2
and validated = false and deleted =false and errors is not null
and "createdAt" < '2022-08-17'::date



select distinct oo."orderInfoData" ->'trackCode'->>'value' 
from "OriginalOrders" oo where oo."cityID" = 2
and oo.validated = false and oo.deleted =false and oo.errors is not null
and oo."createdAt" >= '2022-07-06 07:30:00.000 -0500'::date










select * from "Orders" o where id = 930132


select * from "OrderService" os where "orderID" = 930132

select * from "OrderServiceHistorial" osh where "orderServiceID" = 1281910










select * from "GeneralTypes" gt where "class" ilike 'estado de la Orden'

























