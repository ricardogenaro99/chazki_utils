const queryGetOrderServiceHistorial = (trackCode) => {
	const query = `
    select
    h."statusID",
    case
      h."statusID" when 169 then i.extra -> 'enterpriseHook' -> '4396' ->> 'statusCode'
      else gt.extra -> 'enterpriseHook' -> '4396' ->> 'statusCode'
    end as "falabellaStatusCode",
    h."createdAt"
    from
      "Orders" o
    inner join "OrderService" os on
      os."orderID" = o.id
      and os.deleted = false
    inner join "OrderServiceHistorial" h on
      h."orderServiceID" = os.id
      and h.deleted = false
    left join "GeneralTypes" gt on
      h."statusID" = gt.subtype
    left join "Incidence" i on
      h."incidenceID" = i.id
    where
      o."enterpriseID" = 4396
      and o."trackCode" in ('${trackCode}')
      and h."statusID" in (
      select
        ebbsh."statusID"
      from
        "EnterprisesBodyByStateHooks" ebbsh
      where
        ebbsh."enterpriseID" = 4396)
    order by
      h."createdAt";
  `;

	return query;
};

module.exports = {
	queryGetOrderServiceHistorial,
};
