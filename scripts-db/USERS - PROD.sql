select  u.deleted , a."userID" , a.deleted ,gt.subclass , r."routeCode" , a."currentRouteID" , a."currentVehicleID", u.email, u."password" , u.names , u.lastname , a."userID"  , u."password"  , u."countryID" , u."cityID" , u."clientIDs" , a.*  
from "Users" u 
left join "Affiliates" a on a."userID" = u.id 
left join "AffiliatesAgency" aa on aa.id = a."agencyID" 
left join "AffiliateVehicles" av on av.id = a."currentVehicleID" 
left join "Routes" r on a."currentRouteID" = r.id 
left join "GeneralTypes" gt on r."statusID" = gt.subtype 
where  u.email in ('jesus05tf@gmail.com',
'rubenisaacrp@gmail.com',
'leonardoca17.lca@gmail.com',
'clariatnysojeda@gmail.com',
'samuel_161195@hotmail.com',
'ernestogabrielromanelli@gmail.com',
'fernandomsnjr@gmail.com')
order by a."currentRouteID" , a."currentVehicleID" 
--b-jacqueline.paez@chazki.com	$2b$10$25UHjQ05j.DvKYRDUC.aP.sqGciIXdf4.b0agHQiTqcmlDI/CI3tK
--1:				$2a$10$Y/ag2UqAlTu0vNLT/uL6Pu0y..pbKryeW3eOT5fEL4HV/6DrlB6uS
--chazki2022:		$2a$10$IA3kv3pjAQodFatApxupOuS/ed6XvBfj8zUuYFHR55kO2bjE9MZH2











