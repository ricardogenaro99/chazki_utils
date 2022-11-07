require("dotenv").config();
const fs = require("fs");
const querys = require("./querys.js");
const axios = require("axios");

const urlBackend = process.env.BACKEND || "";
const token = process.env.BEARER || "";

const config = {
	headers: {
		"Content-type": "application/json",
		Authorization: token,
	},
};

const routesID = [];

const variables = routesID.map((id) => {
	return {
		routeID: id,
	};
});

const run = async (variables) => {
	const arrResponse = [];

	for (let index in variables) {
		const num = (Number(index) * 100 + 100) / variables.length;
		try {
			const result = await axios.post(
				urlBackend,
				{
					query: querys.deleteRoute,
					variables: variables[index],
				},
				config,
			);

			arrResponse.push({
				routeID: variables[index].routeID,
				response: result.data,
			});

			console.log(
				`${parseFloat(num).toFixed(4)}% => {ID: ${
					variables[index].routeID
				}, Status: ${result.data.errors ? "Error" : "Done"}}`,
			);
		} catch (e) {
			console.error(e);
		}
	}

	fs.writeFileSync("./result.log", JSON.stringify(arrResponse, null, 4));
};

run(variables);
