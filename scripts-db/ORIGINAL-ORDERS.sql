select * from "Enterprises" e where "enterpriseKey" = '8488efb6-4cdc-4b3f-af9e-65ceaccf7758'

select 
distinct A."orderInfoData" ->'trackCode'->>'value' ,  
A."orderInfoData" ->'dropPoint'->>'coordinates', A."orderInfoData" ->'pickUpPoint'->>'coordinates' ,
A."orderInfoData" ->'pickUpNotes'->>'value'
--A.*
from (
	select * from "OriginalOrders" oo where 
	"csvHistorialID" in ( 
		select c.id  from "CSVHistorial" c where c."enterpriseID" = 4523 and c."createdAt" between '2022-11-02' and '2022-11-04' 
	) 
) as A  where A."orderInfoData" ->'trackCode'->>'value' in ('41770592498' );
--order by A.id desc



select * from "OriginalOrders" oo where 
	"csvHistorialID" in ( 
		select c.id  from "CSVHistorial" c where c."enterpriseID" = 5448 and c."createdAt" between '2022-11-02' and '2022-11-19' 
	) and "orderInfoData" ->'trackCode'->>'value' in ('1274600501942-01') 



	
	
select * from "OriginalOrders" oo where id = 2729037




select "serviceIDs" , multiplace , "enterpriseConfig" , * from "Enterprises" e where id = 5451


select * from "Branches" b where "enterpriseID" = 5451


