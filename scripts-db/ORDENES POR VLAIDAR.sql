select "enterpriseID" , "packageSizeID" , "serviceID" ,* from "Orders" o where "trackCode" = '41722160444'

select * from "PackageSizes" ps where id in (7,8,9,10,11)

select "serviceIDs" , * from "Enterprises" e where id = 5429

(243,252,253)

select * from "Services" s where id in (243,244,252,253,245)









select * from "Orders" o where "cityID" = 5 and "createdAt" < '2022-10-10' 
and ("trackCode" not ilike 'DELETED-%' 
or deleted = true)

update "Orders" set "trackCode"  = ( 'DELETED-' || "trackCode"), deleted = true where "cityID" = 5 and "createdAt" < '2022-10-10' 
and ("trackCode" not ilike 'DELETED-%' )











