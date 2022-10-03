


update "Stock" set dispatched =false ,"dispatchedDate" =null  where "trackCode" in (select "trackCode" from "Orders" o where id in ( 
select "orderID" from "OrderService" where "routeID" = (select id from "Routes" r where "routeCode" ='') and active=true ));


select * from "Stock" s where "trackCode" in (select "trackCode" from "Orders" o where id in ( 
select "orderID" from "OrderService" where "routeID" = (select id from "Routes" r where "routeCode" ='042f2831') and active=true ));


select * from "OrderService" os where "orderID" = 855088

select * from "Routes" r where "routeCode" = '3f63f2b8'


------- 

select id, "cityID" , * from "Enterprises" e where "comercialName" ilike '%Supletech%'

select * from "Stock" s where "enterpriseID" = 5327  and "enterDate" between '2022-08-29' and '2022-09-01' and "cityID" is null 

update "Stock" set "cityID" = 6 where   "enterpriseID" = 5327  and "enterDate" between '2022-08-29' and '2022-09-01' and "cityID" is null 







-- disabledRadio -> antes true - ahora false

select * from "Cities" c  where "countryID" = 3