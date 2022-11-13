-- BUSCAR RUTA
select r.activities , r.id , r.deleted , r."createdAt" , r."routeCode",  gt.subclass , r.price , r."finishRouteTime" , r."realStartTime", r."statusID" , r.activities , r."affiliateVehicleID" , r."affiliateID", r."routeAlias"  , r.* from "Routes" r 
left join "GeneralTypes" gt on r."statusID" = gt.subtype 
where r."routeCode" in ('de6887fa')
--1904939
--1904940

-- ORDENES DE RUTA
select  distinct o.id, o.deleted, o."enterpriseID"  , r."routeCode" , o."trackCode"   , gt.subclass , 
o.crossdocking , o."updatedAt"  , o."isPickedUp" , o."cityID", o."classificationOrderID" --, os.*
from "OrderService"  os 
inner join "Routes" r on os."routeID" = r.id and r."routeCode" in ('de6887fa')
left join "Orders" o on os."orderID" = o.id 
left join "GeneralTypes" gt on o."statusID" = gt.subtype 
--where os."typeID" = 181

select * from "OrderService" os where "orderID" = 452841

select * from "OrderServiceHistorial" osh where "orderServiceID" 


--rserrudo19@gmail.com
select "currentRouteID" , * from "Affiliates" a where deleted = false and "currentVehicleID" is not null and "userID" = 'e2a438ea-8602-4da0-a5af-404d962c8d78'

select * from "Users" u where id = 'e2a438ea-8602-4da0-a5af-404d962c8d78'





select * from "Orders" o where 



