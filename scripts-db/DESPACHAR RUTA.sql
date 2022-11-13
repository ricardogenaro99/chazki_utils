


--update "Stock" set dispatched =false ,"dispatchedDate" =null  where "trackCode" in (select "trackCode" from "Orders" o where id in ( 
--select "orderID" from "OrderService" where "routeID" = (select id from "Routes" r where "routeCode" ='259de282') and active=true ));


select * from "Stock" s where "trackCode" in (select "trackCode" from "Orders" o where id in ( 
select "orderID" from "OrderService" where "routeID" = (select id from "Routes" r where "routeCode" ='686fb9b6') and active=true ));


select * from "Routes" r where "routeCode" = '8f18be3e'


-----------------------------------------------------------


select * from "Users" u where email = 'diana.pasapera@chazki.com'


select * from "Roles" r where "countryID" = 1

