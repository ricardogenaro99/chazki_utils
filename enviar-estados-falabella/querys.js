const { TIME_INTERVAL } = require("./generalConst");

const queryUpdateIntegrationLogs = (order) => {
	const query = `update "IntegrationLogs" set processed = true , "updatedAt" = now()   where "trackCode" = '${order}' and processed = false;`;
	return query;
};

const queryGetTrackCodesFromIntegrationLogs = () => {
	const query = `select distinct il."trackCode" , o."statusID"  from "IntegrationLogs" il 
									inner join "Orders" o on o."trackCode" = il."trackCode" and o."enterpriseID" = 4396
									where il.processed = false and il."createdAt" > '2022-12-01';`;
	return query;
};

const queryGetTrackCodesFromOrders = () => {
	const query = `select  o."trackCode", o."statusID"  from "Orders" o where o."enterpriseID" = 4396  
	and o."statusID" in (SELECT ebbsh."statusID"  from "EnterprisesBodyByStateHooks" ebbsh where ebbsh."enterpriseID" = 4396)
	and o."updatedAt" between (now() - interval '${TIME_INTERVAL}  minute') and now();`

	return query;
};

module.exports = {
	queryUpdateIntegrationLogs,
	queryGetTrackCodesFromIntegrationLogs,
	queryGetTrackCodesFromOrders,
};
