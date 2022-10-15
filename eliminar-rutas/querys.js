module.exports = {
	deleteRoute: `
    mutation deleteRoute($routeID: Int) {
      DeleteRoute: deleteRoute(routeID: $routeID)
    }
  `,
};
