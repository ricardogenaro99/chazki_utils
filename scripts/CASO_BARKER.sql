select * from "Orders" o where "trackCode" in ('PRUEBA_S', 'PRUEBA_L')

select * from "OrderService" os where os."orderID" in (901270,
901252)

select * from "Routes" r where id in (55104,
55105)




select * from "Routes" r where "routeCode" = '4d1b3816'

select o.* from "OrderService"  os 
inner join "Routes" r on os."routeID" = r.id and r."routeCode" in ('4d1b3816')
left join "Orders" o on os."orderID" = o.id 
left join "GeneralTypes" gt on o."statusID" = gt.subtype 
where o."trackCode" in ('MIA00090883CL','MIA00090833CL') or o."statusID"  not in (166)
order by gt.subclass desc




select * from "Orders" o where "trackCode" in ('MIA00090883CL','MIA00090833CL')



select * from "Routes" r where "routeCode" in ('4d1b3816','09d8b634')







select * from "OrderService" os where "orderID" = 877309

select * from "OrderServiceHistorial" osh where osh."orderServiceID" = 1188074


