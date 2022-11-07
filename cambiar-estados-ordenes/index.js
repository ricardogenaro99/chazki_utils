require("dotenv").config();
const fs = require("fs");
const querys = require("./querys.js");
const axios = require("axios").default;

const urlBackend = process.env.BACKEND || "";
const token = process.env.BEARER || "";

const config = {
	headers: {
		"Content-type": "application/json",
		Authorization: token,
	},
};

const ordersID = [];

const variables = ordersID.map((id) => {
	return {
		orderID: id,
		dataUpdOrder: {
			statusID: 170,
			incidenceID: null,
		},
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
					query: querys.updateOrderData,
					variables: variables[index],
				},
				config,
			);

			arrResponse.push({
				orderID: variables[index].orderID,
				response: result.data,
			});

			console.log(
				`${parseFloat(num).toFixed(4)}% => {ID: ${
					variables[index].orderID
				}, Status: ${result.data.errors ? "Error" : "Done"}}`,
			);
		} catch (e) {
			console.error(e);
		}
	}

	fs.writeFileSync("./result.log", JSON.stringify(arrResponse, null, 4));
};

run(variables);
