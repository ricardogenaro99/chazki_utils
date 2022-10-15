require("dotenv").config();
const fs = require("fs");
const client = require("./db");
const queryDelete = require("./querys");

const orderIDs = [360317, 360319, 360321];

const run =  () => {
	client.connect();
	const response = [];
	orderIDs.forEach(async (id) => {
		const res = await client.query(queryDelete(id));
		response.push(res);
		console.log(res);
	});
	return response;
};

fs.writeFileSync("response.log", JSON.stringify(run(), null, 2));
