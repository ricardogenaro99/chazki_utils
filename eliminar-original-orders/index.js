require("dotenv").config();
const fs = require("fs");
const client = require("./db");
const queryDelete = require("./querys");
const { DATA } = require("./data");

const arrResult = {
	response: [],
	responseError: [],
};

const run = async () => {
	client.connect();
	DATA.forEach(async (id, index) => {
		try {
			await client.query(queryDelete(id)).then((result) => {
				const num = (Number(index) * 100 + 100) / DATA.length;
				const msg =
					"Status: " +
					result.command +
					" " +
					result.rowCount +
					" porcentaje: " +
					parseFloat(num).toFixed(2) +
					"%" +
					" ID: " +
					id;

				console.log(msg);
				arrResult.response.push({ index, msg });
			});
		} catch (error) {
			arrResult.responseError.push({ id, error });
			fs.writeFileSync("response.log", JSON.stringify(arrResult, null, 2));
		}
	});
};

run();
