require("dotenv").config();
const fs = require("fs");
const client = require("./db");
const queryDelete = require("./querys");

// Orders ID
const DATA = [1295970,
	1296032,
	1302706,
	1302801,
	1302990,
	1303316,
	1303309];

const generateLoader = (index, type = "DONE") => {
	const num = (Number(index) * 100 + 100) / DATA.length;
	return `${parseFloat(num).toFixed(4)}% ==> ID: ${DATA.at(index)} - ${type}`;
};

const run = () => {
	client.connect();
	DATA.forEach(async (id, index) => {
		try {
			const res = await client.query(queryDelete(id));
			console.log(generateLoader(index));
			console.log(
				"DELETED COUNT => %s \n",
				JSON.stringify(res.map((e) => e.rowCount)),
			);
		} catch (error) {
			console.log(generateLoader(index, "ERROR"));
			console.log("ERROR => %s \n", JSON.stringify(error));
		}
	});
};

run();
