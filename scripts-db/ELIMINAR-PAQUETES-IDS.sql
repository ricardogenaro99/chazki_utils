select * from "Orders" o where "trackCode" ilike '';

------

select * from "Orders" o where id in (
)

---------------------------------------------------------------------------

delete from "OrderServiceHistorial" osh where osh."orderServiceID" in (
	select os.id from "OrderService" os where os."orderID" in (
))


delete from "OrdersImages" where "orderID" in (
)


delete from "OrderServiceCommentary" osc   where osc."orderID" in (
)


delete from "OrderService" os where os."orderID" in (
)


delete from "Activities" a where a."orderID" in (
)


delete from "Stock" where "orderID" in (
)

delete from "OrderPackages" op where "orderID" in (
)

delete from "CFDIHistorial" c where "orderID" in (
)


delete from "Orders" o where id in (
)

