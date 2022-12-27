require("dotenv").config();
const fs = require("fs");
const client = require("./db");
const queryDelete = require("./querys");

// Orders ID
const DATA = [];

const generateLoader = (index, type = "DONE") => {
	const num = (Number(index) * 100 + 100) / DATA.length;
	return `${parseFloat(num).toFixed(4)}% ==> ID: ${DATA.at(index)} - ${type}`;
};

const run = async () => {
	await client.connect();
	const result = await Promise.all(
		DATA.map(async (id, index) => {
			let status = "";
			let message = "";
			try {
				const res = await client.query(queryDelete(id));
				status = "DONE";
				message =
					"DELETED COUNT => " + JSON.stringify(res.map((e) => e.rowCount));
			} catch (error) {
				status = "ERROR";
				message = "ERROR => " + JSON.stringify(error);
			} finally {
				console.log(generateLoader(index, status));
				console.log(message, "\n");
			}
			return { id, status, message };
		}),
	);

	await client.end();

	fs.writeFileSync("result.log", JSON.stringify(result, null, 2));
};

run();
