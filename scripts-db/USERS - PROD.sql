select * from "Cities" c where id = 5

select * from "Enterprises" e where "comercialName" ilike '%Arca%continental%'

select * from "Users" u where "enterpriseID" = 5425

--select a."currentRouteID" , a."currentVehicleID", u.email , u."password"  , u."countryID" , u."cityID" , a.*  
select a.*
from "Users" u 
left join "Affiliates" a on a."userID" = u.id 
left join "AffiliatesAgency" aa on aa.id = a."agencyID" 
left join "AffiliateVehicles" av on av.id = a."currentVehicleID" 
where  
 u.email ilike 'soporte_ti%'
--real:				$2b$10$JunpCe1.RywUK5jvf0WN3eSXfu2lTxJ5KLZ74evVeH2mDw3oSJnG.
--1:				$2a$10$D6O2n4d.5dKBWj7PoRWzgeo.Qu/YGPtqxoeoZib851KHhJYG697b6
--chazki2022:		$2a$10$IA3kv3pjAQodFatApxupOuS/ed6XvBfj8zUuYFHR55kO2bjE9MZH2

select * from "Step" s 

select * from "AffiliateVehicles" av 

select * from "Users" u where email ilike '%John.ramirez@chazki.com'


select * from "AffiliateVehicles" av where id = 9050

--yarem.gonzalez@chazki.com


select * from "Users" u where email ilike 'manuguec@yahoo.com'


select "currentRouteID" , * from "Affiliates" a where "userID" = '62b4a0a0-5e67-4424-bda3-716856238b77'



select "routeAlias" , * from "Routes" r where "routeAlias" ilike '%OESTE%'