-- BUSCAR RUTA: 66948
select r.id , r.deleted , r."createdAt" , r."routeCode",  gt.subclass , r.price , r."finishRouteTime" , r."realStartTime", r."statusID" , r.activities , r."affiliateVehicleID" , r."affiliateID", r."routeAlias"  , r.* from "Routes" r 
left join "GeneralTypes" gt on r."statusID" = gt.subtype 
where r."routeCode" in ('47b92f28')
--{1901165,1901209,1901166,1901210}

select * from "Activities" a where id in (1901165,1901209,1901045,1901166,1901210,1901046) and "routeID" = 68328

select * from "Orders" o where id = 1202893

select * from "OrderService" os where "orderID" = 1202893

select * from "OrderServiceHistorial" osh where "orderServiceID" in (1566131)


-- ORDENES DE RUTA
select  distinct  o.id, o.deleted, o."enterpriseID"  , r."routeCode" , o."trackCode"   , gt.subclass , 
o.crossdocking , o."updatedAt"  , o."isPickedUp" , o."cityID", o."classificationOrderID" , o.*
from "Activities" os 
inner join "Routes" r on os."routeID" = r.id and r."routeCode" in ('47b92f28')
left join "Orders" o on os."orderID" = o.id 
left join "GeneralTypes" gt on o."statusID" = gt.subtype 
order by r."routeCode"


-- AFILIADO DE RUTA
select "currentRouteID", r."routeCode"  , "currentVehicleID" , a.* from "Affiliates" a 
inner join "Routes" r on r.id = a."currentRouteID" and r."routeCode" in ('4b911c37')


-- ORDER SERVICE HISTORIAL DE RUTA
select r."routeCode" , o."trackCode" , os.id as "orderServiceID", o."statusID" as "statusIdOrder" , os."lastStatusID" as "statusIdsOrderService", osh."statusID", osh.motive  ,gt.subclass , osh.deleted,  u.names , O.* 
from "OrderServiceHistorial" osh 
inner join "OrderService" os on os.id = osh."orderServiceID" and os.active = true
inner join "Orders" o on o.id = os."orderID"
inner join "Routes" r on r."routeCode" = '744ae673' and r.id = os."routeID" 
left join "GeneralTypes" gt on osh."statusID" = gt.subtype 
left join "Users" u on u.id = osh."userIDUpdate" 
order by r."routeCode" desc, o."trackCode" desc , os.id asc, osh.id asc 



-- HISTORIAL DE RUTAS DE UN DRIVER
select id, "routeCode" , "createdAt" , "updatedAt" , "statusID" , price , "finishRouteTime" , "realStartTime"  from "Routes" r where "createdAt" >= '2022-10-01' and "affiliateID" = '98fde4fd-60f9-44d2-8e11-16ad5ff4d3ab'
order by "createdAt" desc




-- PUNTOS DE RECOLECCION INCORRECTOS
select o.id  , o.deleted , r."routeCode" , o."trackCode"   , o."pickUpAddress" , o."pickUpPoint" , os."addressPoint" , os.*
from "Activities"  os 
inner join "Routes" r on os."routeID" = r.id and r."routeCode" in ('')
left join "Orders" o on os."orderID" = o.id 
where os."typeID" = 181


select "cityID" , * from "Users" u where email = 'caromart85@gmail.com'


select "warehouseID" , * from "Orders" o where id = 1137281











