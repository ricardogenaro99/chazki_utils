select o."trackCode"  from "Orders" o where "enterpriseID" = 4396 and "statusID" = 166 and deleted = false and o.id in (
select os."orderID" from "OrderService" os where os."endTime" between '2022-09-16 12:00:00.000 -0500' and '2022-09-16 16:00:00.000 -0500')


select * from "Orders" o where "trackCode" in ('149075039871','149075136744') -- and "statusID" = 198
order by "statusID" 

select * from "OrdersImages" oi where "orderID" in (1002540,1002731)

select distinct  "Orders"."id",
 "Orders"."trackCode",
 "Orders"."updatedAt",
 "Orders"."receptorAcuse",
 "Orders"."relationshipAcuse",
 "Orders"."dropContactDocumentNumber",
 "Orders"."receptorDocument",
 "Status"."subtype" AS "Status.subtype",
 "Status"."extra" AS "Status.extra",
 "Enterprise"."id" AS "Enterprise.id",
 "Enterprise"."documentNumber" AS "Enterprise.documentNumber",
 "Enterprise->City"."id" AS "Enterprise.City.id",
 "Enterprise->City"."timeZone" AS "Enterprise.City.timeZone",
 "OrderService->Routes->Affiliates->User"."documentNumber" as "documento-driver" ,
 "OrderService"."id" AS "OrderService.id",
 "OrderService"."routeID" AS "OrderService.routeID",
 "OrderService->Routes"."id" AS "OrderService.Routes.id",
 "OrderService->Routes"."affiliateID" AS "OrderService.Routes.affiliateID",
 "OrderService->Routes->Affiliates"."userID" AS "OrderService.Routes.Affiliates.userID",
 "OrderService->Routes->Affiliates->CurrentVehicle"."id" AS "OrderService.Routes.Affiliates.CurrentVehicle.id",
 "OrderService->Routes->Affiliates->CurrentVehicle"."vehiclePlate" AS "OrderService.Routes.Affiliates.CurrentVehicle.vehiclePlate",
 "OrderService->Routes->Affiliates->User"."id" AS "OrderService.Routes.Affiliates.User.id",
 "OrderService->Routes->Affiliates->User"."names" AS "OrderService.Routes.Affiliates.User.names",
 "OrderService->Routes->Affiliates->User"."lastname" AS "OrderService.Routes.Affiliates.User.lastname",
 "OrderService->Routes->Affiliates->User"."documentNumber" AS "OrderService.Routes.Affiliates.User.documentNumber",
 "Activities"."id" AS "OrderService.Routes.Affiliates.LocationAffiliate.id",
 "Activities"."addressPoint" AS
 "OrderService.Routes.Affiliates.LocationAffiliate.locationPoint",
 "Activities"."updatedAt" AS "OrderService.Routes.Affiliates.LocationAffiliate.updatedAt",
 "OrdersImages"."id" AS "OrdersImages.id",
 "OrdersImages"."url" AS "OrdersImages.url",
 "Incidence"."extra" as "Incidence.extra",
 'EVIDENCE' as "ImageType"
FROM "Orders" AS "Orders"
LEFT OUTER JOIN "Activities" AS "Activities" on "Activities"."orderID" = "Orders".id
LEFT OUTER JOIN "GeneralTypes" AS "Status" ON "Orders"."statusID" = "Status"."subtype"
LEFT OUTER JOIN "Enterprises" AS "Enterprise" ON "Orders"."enterpriseID" = "Enterprise"."id"
LEFT OUTER JOIN "Cities" AS "Enterprise->City" ON "Enterprise"."cityID" = "Enterprise->City"."id"
LEFT OUTER JOIN "OrderService" AS "OrderService" ON "Orders"."id" = "OrderService"."orderID"
LEFT OUTER JOIN "Routes" AS "OrderService->Routes" ON "OrderService"."routeID" = "OrderService->Routes"."id"
LEFT OUTER JOIN "Affiliates" AS "OrderService->Routes->Affiliates"
ON "OrderService->Routes"."affiliateID" = "OrderService->Routes->Affiliates"."userID"
LEFT OUTER JOIN "AffiliateVehicles" AS "OrderService->Routes->Affiliates->CurrentVehicle"
ON "OrderService->Routes->Affiliates"."currentVehicleID" = "OrderService->Routes->Affiliates->CurrentVehicle"."id"
LEFT OUTER JOIN "Users" AS "OrderService->Routes->Affiliates->User"
ON "OrderService->Routes->Affiliates"."userID" = "OrderService->Routes->Affiliates->User"."id"
LEFT OUTER JOIN "LocationAffiliate" AS "OrderService->Routes->Affiliates->LocationAffiliate"
ON "OrderService->Routes->Affiliates"."userID" = "OrderService->Routes->Affiliates->LocationAffiliate"."affiliateID"
LEFT OUTER JOIN "OrdersImages" AS "OrdersImages"
ON "Orders"."id" = "OrdersImages"."orderID" and "OrdersImages"."groupID"= 183 -- and "OrdersImages"."orderServiceID" = "OrderService"."id"
left outer join "Incidence" AS "Incidence" on "Orders"."lastIncidenceID" = "Incidence"."id"
WHERE "OrderService"."active" = true
/*AND "Orders"."id" in (
	select o.id  from "Orders" o where "enterpriseID" = 4396 and "statusID" = 166 and deleted = false and o.id in (
		select os."orderID" from "OrderService" os where os."endTime" between '2022-09-16 12:00:00.000 -0500' and '2022-09-16 16:00:00.000 -0500'
	)
)
AND ("Orders"."receptorAcuse" is null or "Orders"."relationshipAcuse" is null or "Orders"."dropContactDocumentNumber" is null or "Orders"."receptorDocument" is null)
*/and "Orders"."trackCode" in ('149074189258','149074741075')


select "createdAt" , "classificationOrderID" ,* from "Orders" o where "enterpriseID" = 4396 and "statusID" = 169 and "trackCode" = '149073412621'


select * from "GeneralTypes" gt where "class" = 'Clasificacion de la Orden'



select distinct "trackCode"  from "IntegrationLogs" il where processed = false and "createdAt" between '2022-09-01' and '2022-09-14' and errors is not null



select * from "Orders" o 





select *  from "Routes" r where "cityID" = 5 and "createdAt" <= '2022-09-23' and "statusID" = 215 and "routeCode" = '0abc7b35'



select deleted , * from "Activities" a where a."orderID" in (
select os."orderID"  from "OrderService" os where os."routeID" in (
		select r.id  from "Routes" r where r."cityID" = 5 and r."createdAt" <= '2022-09-23'
	) 
)






select distinct  o.* from "Orders" o 
inner join "OrderService" os on os."orderID" = o.id and os."routeID" is null
where  o."cityID" = 5 and o."statusID" = 197 and o."createdAt" <= '2022-09-23' --and o.deleted = false

select * from "Routes" r where "cityID" = 5 and "createdAt" <= '2022-09-23' and deleted = false

update "OrderService"  set deleted = true  where "orderID" in (
	select o.id from "Orders" o where o."cityID" = 5 and o."createdAt" <= '2022-09-23'
)

select count("statusID"), "statusID"   from "Routes" r where  "cityID" = 5 and  "createdAt" <= '2022-09-23' group by "statusID" 



update "Routes" set deleted = false where "cityID" = 5 and  "createdAt" <= '2022-09-23' and "statusID" in (178,179, 175, 176)



select distinct count(o.id)  from "Orders" o 
left join "Routes" r on r."cityID" = 5
left join "OrderService" os on os."orderID" = o.id 
where os."routeID" is null and o."cityID" = 5


















