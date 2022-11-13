const queryCountOrders = () => {
	const query = `
  select o.id  from "Orders" o 
  inner join "Cities" c on c."countryID" = 4 and o."cityID" = c.id 
  where o."trackCode" ilike 'MEL00%' and o.deleted = false;
`;
	return query;
};

const queryCountOriginalOrders = () => {
	const query = `
  select oo.id from "OriginalOrders" oo 
  inner join "Cities" c on c."countryID" = 4 and oo."cityID" = c.id
  where oo."orderInfoData" ->'trackCode'->>'value' ilike  'MEL00%' and oo.deleted = false;
`;
	return query;
};

const queryUpdateOrder = (id) => {
	const query = `update "Orders" set deleted = true where id in (${id});`;
	return query;
};

const queryUpdateOriginalOrder = (id) => {
	const query = `update "OriginalOrders"  set deleted = true where id in (${id});`;
	return query;
};

module.exports = {
	queryCountOrders,
	queryCountOriginalOrders,
	queryUpdateOrder,
	queryUpdateOriginalOrder,
};
