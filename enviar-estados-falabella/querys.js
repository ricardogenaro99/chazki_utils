const queryUpdateIntegrationLogs = (order) => {
	const query = `update "IntegrationLogs" set processed = true where "trackCode" = '${order}' and processed = false;`;
	return query;
};

const queryCountOrders = () => {
	const query = `select distinct "trackCode"  from "IntegrationLogs" il where processed = false and "createdAt" > '2022-12-01';`;
	return query;
};

module.exports = { queryUpdateIntegrationLogs , queryCountOrders};
