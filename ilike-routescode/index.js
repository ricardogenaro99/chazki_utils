require("dotenv").config();
const fs = require("fs");
const client = require("./db");
const { getRoute } = require("./querys.js");

const DATA = [];

const generateLoader = (array, index, type = "DONE") => {
	const num = (Number(index) * 100 + 100) / array.length;
	return `${parseFloat(num).toFixed(4)}% ==> Ruta: ${array.at(
		index,
	)} - ${type}`;
};

const run = async (array) => {
	const arrResponse = [];
	await client.connect();
	for (let index in array) {
		try {
			const result = await client.query(getRoute(array[index]));

			console.log(generateLoader(DATA, index));

			const obj = {
				ids: result.rows.map((e) => e.id),
				routeCode: array[index],
			};

			arrResponse.push(obj);
		} catch (e) {
			console.error(e);
		}
	}
	await client.end();
	fs.writeFileSync("./result.log", JSON.stringify(arrResponse, null, 4));
};

run(DATA);
