const queryUpdateIntegrationLogs = (order) => {
	const query = `update "IntegrationLogs" set processed = true where "trackCode" = '${order}' and processed <> true;`;
	return query;
};

module.exports = { queryUpdateIntegrationLogs };
