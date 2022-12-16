const getRoute = (routeCode) => `
  select id from "Routes" r where r."routeCode" ilike '%${routeCode}%'
`;

module.exports = {
	getRoute,
};
