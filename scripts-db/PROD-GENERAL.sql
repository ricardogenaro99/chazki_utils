select "statusID" , count("statusID") 
from "Orders" ord where ord."cityID" = 5
and ord.id not in (
	select distinct o.id  from "OrderService" os 
	inner join "Orders" o on o.id = os."orderID" and o."cityID" = 5
	where os."routeID" is not null
) and ord."createdAt" <= '2022-10-10' and ord.deleted = false --and "statusID" = 169
group by "statusID" 
order by ord."statusID" 




select "enterpriseKey" , "comercialName" ,  * from "Enterprises" e where "cityID" = 18 and "enterpriseKey" is not null and deleted = false


select * from "Orders" o where "trackCode" = 'PRUEBA-02-11-GENARO'


 
--al driver José Gonzalez Eloz.
