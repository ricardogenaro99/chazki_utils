select a."currentRouteID" , a."currentVehicleID", u.email , u."password"  , u."countryID" , u."cityID" , a.*  from "Users" u 
left join "Affiliates" a on a."userID" = u.id 
left join "AffiliatesAgency" aa on aa.id = a."agencyID" 
left join "AffiliateVehicles" av on av.id = a."currentVehicleID" 
where  
u.email ilike '%%'



select r."createdAt" , r."routeCode" , gt.subclass , r.price , r."finishRouteTime" , r."realStartTime", "statusID" , r.activities , r.* from "Routes" r 
left join "GeneralTypes" gt on r."statusID" = gt.subtype 
where r."routeCode" in ('5a29688d')



select   r."routeCode" , o."trackCode" , o."cityID" , gt.subclass , o.* from "Activities"  os 
inner join "Routes" r on os."routeID" = r.id and r."routeCode" in  ('5a29688d') 
left join "Orders" o on os."orderID" = o.id 
left join "GeneralTypes" gt on o."statusID" = gt.subtype 
order by r."routeCode" , gt.subclass desc



select "currentRouteID" , * from "Affiliates" a where "currentRouteID" in (
	select r.id  from "Routes" r where r."routeCode" in  ('5a29688d')  
)



select A.* from (
	select * from "OriginalOrders" oo where 
	/*"csvHistorialID" in (
	select c.id  from "CSVHistorial" c where c."enterpriseID" = 3969
	) and */"createdAt" between '2022-09-29' and '2022-10-30'
) as A
where A."orderInfoData" ->'trackCode'->>'value' ilike 'C203100960'
order by A.id desc




select * from "Routes" r where "routeCode" = '41fdfb24'

select * from "Orders" o where "trackCode" in ('C203100960',
'C203103046',
'C203103183',
'C203102606',
'C203102384',
'PSASLRPRS183162601',
'DOL8425490887',
'41690597624',
'41689602020',
'41690157506',
'41690385233')

select * from "OrderService" os where os."orderID"  = 1018795

