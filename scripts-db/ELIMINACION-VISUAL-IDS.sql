update "OrderServiceHistorial"  set deleted = TRUE  where "orderServiceID" in (

))


update "OrdersImages"  set deleted = TRUE    where "orderID" in (
	
)


update "OrderServiceCommentary"     set deleted = TRUE    where "orderID" in (
	
)


update "OrderService"    set deleted = TRUE   where "orderID" in (
	
)


update "Activities"   set deleted = TRUE   where "orderID" in (
	
)


update "Stock"   set deleted = TRUE   where "orderID" in (
	
)


update "OrderPackages"    set deleted = TRUE   where "orderID" in (
	
)


update "Orders"   set deleted = TRUE    where id in (
	select ord.id
	from "Orders" ord where ord."cityID" = 5
	and ord.id not in (
		select distinct o.id  from "OrderService" os 
		inner join "Orders" o on o.id = os."orderID" and o."cityID" = 5
		where os."routeID" is not null
	) and ord."createdAt" <= '2022-10-10' and ord.deleted = false and "statusID" = 197
)

