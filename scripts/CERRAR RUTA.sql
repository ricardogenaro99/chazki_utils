select "cityID" , "countryID" , * from "Users" u where email = 'soporte_ti@gmail.com'

select * from "Affiliates" a where "userID" in ('9b73d2c3-8574-4cba-8214-f3137628f2d8','f0e511b1-6535-4088-8ceb-9879e664b944') 

select * from "AffiliateVehicles" av where av."affiliateID" = '9b73d2c3-8574-4cba-8214-f3137628f2d8'


select * from "GeneralTypes" gt where "class" = 'Estado de Afiliado'


select r."createdAt" , r."routeCode" , gt.subclass , r.price , r."finishRouteTime" , r."realStartTime", r."statusID" , r.activities , r.* from "Routes" r 
left join "GeneralTypes" gt on r."statusID" = gt.subtype 
where r."routeCode" in ('f27e78c0')


select distinct   r."routeCode" , o."trackCode" , o."cityID" , gt.subclass , o.* from "OrderService"  os 
inner join "Routes" r on os."routeID" = r.id and r."routeCode" in  ('75d892ab') 
left join "Orders" o on os."orderID" = o.id 
left join "GeneralTypes" gt on o."statusID" = gt.subtype 
order by r."routeCode" , gt.subclass desc


select "currentRouteID" ,  * from "Affiliates" a where "currentRouteID" in (
select r.id  from "Routes" r where r."routeCode" in  ('75d892ab')  
)


------------------------

select "statusID" , "createdAt" ,"cityID" , * from "Routes" r where "routeCode" in ('c8d8e2bf',
'f1f4f959',
'8927e279',
'a9fd8cfb',
'273a0d6f',
'75d892ab')
order by "createdAt" desc


select * from "Orders" o where id = 579782

select * from "OrderService" os where "orderID" = 579782 and id = 730782
--1329046 endtime null


select * from "OrderServiceHistorial" osh where "orderServiceID" = 730782




select * from "GeneralTypes" gt where subtype in (177, 215)

--------------------------

select * from "Routes" r where "affiliateID" = '9d810271-cdda-4232-a54f-0c93ed682640'
order  by  "createdAt" desc






