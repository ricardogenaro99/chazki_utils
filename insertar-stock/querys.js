const query = ({ warehouseID, enterpriseId, trackcode, cityID }) => {
	const queryInsert = `
  INSERT INTO public."Stock"
  ("locationBranchID", "orderID", "enterDate", "statusID", quantity, dispatched, "dispatchedDate", 
  "createdAt", "updatedAt", "quantityDispatch", "warehouseID", "enterpriseID", deleted, "trackCode", "cityID", "userIDCreation", "userIDDispatch")
  VALUES(NULL, NULL, NULL, 209, 1, false, NULL, now(), now(), NULL, ${warehouseID}, ${enterpriseId}, false, '${trackcode}', ${cityID}, NULL, NULL);
`;
	return queryInsert;
};

module.exports = query;
