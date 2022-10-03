select * from "Enterprises" e where "comercialName" ilike '%suck%'

select A.* from (
	select * from "OriginalOrders" oo where 
	/*"csvHistorialID" in (
	select c.id  from "CSVHistorial" c where c."enterpriseID" = 4523
	) and*/ "createdAt" between '2022-9-21' and '2022-11-30'
) as A
where A."orderInfoData" ->'trackCode'->>'value' ilike '%VELAQUIN170%'


select * from "OriginalOrders" oo where id in (2051566)


select * from "OriginalOrders" oo where "csvHistorialID" in (select c.id  from "CSVHistorial" c where c."enterpriseID" = 5344) --and oo.extra is not null 



select "createdAt" , "trackCode" , "pickUpAddress" , "dropPoint" , "dropAddress" , * from "Orders" o where "trackCode"in ('MIA00129032CL',
'MIA00133121CL',
'MIA00134153CL',
'MIA00134923CL',
'MIA00134627CL')



select * from "CSVHistorial" c where "enterpriseID" = 5344 and "createdAt" between '2022-09-07' and '2022-09-09' order by id desc 

select o."trackCode" , o."originalOrderID"  from "Orders" o where  "enterpriseID" = 5344 and "createdAt" between '2022-09-07' and '2022-09-09' and "trackCode" = 'MIA00108872CL'



SELECT id, A."orderInfoData" ->'trackCode'->>'value'
FROM (  SELECT  *, 
                COUNT(*) OVER(PARTITION BY "orderInfoData" ->'trackCode'->>'value') N
        FROM "OriginalOrders") as A
WHERE N > 1