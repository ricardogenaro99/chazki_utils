const queryGetOrderServiceHistorial = (trackCode) => {
	const query = `select h."statusID" , h."createdAt" , h."updatedAt"  from "Orders" o 
  inner join "OrderService" os on os."orderID" = o.id  and os.deleted = false
  inner join "OrderServiceHistorial" h on h."orderServiceID" = os.id  and h.deleted = false 
  and h."statusID" in (SELECT ebbsh."statusID"  from "EnterprisesBodyByStateHooks" ebbsh where ebbsh."enterpriseID" = 4396)
  where o."trackCode" in ('${trackCode}')
  order by h."createdAt";`;

	return query;
};

module.exports = {
	queryGetOrderServiceHistorial,
};
