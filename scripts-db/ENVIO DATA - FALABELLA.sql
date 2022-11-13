select o."trackCode", "statusID"  from "Orders" o where "enterpriseID" = 4396 and "statusID" = 166 and deleted = false and o.id in (
select os."orderID" from "OrderService" os where os."endTime" between '2022-10-05 00:00:00.000 -0500' and '2022-10-05  23:00:00.000 -0500') 

select "createdAt" , * from "Orders" o where "enterpriseID" = 4396 and "statusID" = 169 and "trackCode" = '149076209731'


select gt.subclass ,o."trackCode" , o.* from "Orders" o 
left join "GeneralTypes" gt on o."statusID" = gt.subtype 
where "trackCode" in ('140001406278','149081370645')
order by "statusID" ;

select * from "Orders" o where "enterpriseID" = 4396 and "statusID" = 169


select o."trackCode" , os.id , osh."statusID", gt.subclass , osh."createdAt" , osh."updatedAt"  from "OrderServiceHistorial" osh 
left join "OrderService" os on osh."orderServiceID" = os.id 
left join "Orders" o on os."orderID" = o.id 
left join "GeneralTypes" gt on osh."statusID" = gt.subtype 
where o."trackCode"  in ('140001403600',
'149081229445') and os.deleted = false and osh.deleted = false
order by o."trackCode" , os.id , osh.id 



--REPROGRAMMING

select * from "OrdersImages" oi where "orderID" in (1203202)

select distinct  "Orders"."id",
"Orders"."statusID" ,
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
)*/
--AND ("Orders"."receptorAcuse" is null or "Orders"."relationshipAcuse" is null or "Orders"."dropContactDocumentNumber" is null or "Orders"."receptorDocument" is null)
--and "Orders"."receptorDocument" ilike '% %'
and "Orders"."trackCode" in ('140001406278',
'149081370645')




select names, lastname, "cityID", "countryID",  * from "Users" u where u.email ilike '%andrea.manrique@chazki.com%'



select * from "Incidence" i where "statusIDVinculated" = 169 and "countryID" = 1



select * from "Orders" o where "trackCode" in ('140001403600','149081229445','149081255788')


select * from "Orders" o where id in (1203202,
1203157)


select * from "OrdersImages" oi where oi."orderID" in (1203202,
1203157)








