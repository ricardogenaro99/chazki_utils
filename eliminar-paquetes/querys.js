const queryDelete = (id) => {
	const query = `
    delete from "OrderServiceHistorial" osh where osh."orderServiceID" in (
      select os.id from "OrderService" os where os."orderID" in (${id}));

    delete from "OrdersImages" where "orderID" in (${id});

    delete from "OrderServiceCommentary" osc   where osc."orderID" in (${id});

    delete from "OrderService" os where os."orderID" in (${id});

    delete from "Activities" a where a."orderID" in (${id});

    delete from "Stock" where "orderID" in (${id});

    delete from "OrderPackages" op where "orderID" in (${id});

    delete from "CFDIHistorial" c where "orderID" in (${id});  

    delete from "Orders" o where id in (${id});
    `;
	return query;
};

module.exports = queryDelete;
