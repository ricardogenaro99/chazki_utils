delete from "OrderServiceHistorial" osh where osh."orderServiceID" in (
	select os.id from "OrderService" os where os."orderID" in (select o.id FROM "Orders" o where o."trackCode" in (
		'UF257809',
		'UF255924'
	)
))


delete from "OrdersImages" where "orderID" in (select o.id FROM "Orders" o where o."trackCode"in (
		'UF257809',
		'UF255924'
)	)


delete from "OrderServiceCommentary" osc   where osc."orderID" in (select o.id FROM "Orders" o where o."trackCode" in (
		'UF257809',
		'UF255924'
)	)


delete from "OrderService" os where os."orderID" in (select o.id FROM "Orders" o where o."trackCode" in (
		'UF257809',
		'UF255924'
)	)


delete from "Activities" a where a."orderID" in (select o.id FROM "Orders" o where o."trackCode" in (
		'UF257809',
		'UF255924'
)	)


delete from "Stock" where "orderID" in (select o.id FROM "Orders" o where o."trackCode" in (
		'UF257809',
		'UF255924'
)	)


delete from "Orders" o where "trackCode" in (
		'UF257809',
		'UF255924'
)


select "createdAt"  from "Orders" o where "trackCode" in (
		'UF257809',
		'UF255924'
)




select * from "Orders" o where "trackCode" in (
			'UF257809',
		'UF255924'
)

