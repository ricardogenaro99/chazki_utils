require("dotenv").config();
const fs = require("fs");
const querys = require("./querys.js");
const axios = require("axios").default;

const token = process.env.BEARER || "";

const config = {
	headers: {
		"Content-type": "application/json",
		Authorization: token,
	},
};

const ordersID = [452603];

const run = async (variables) => {
	const arrResponse = [];

	for (let index in variables) {
		const num = (Number(index) * 100 + 100) / variables.length;
		try {
			const result = await axios.post(
				process.env.BACKEND,
				{
					query: querys.updateOrderData,
					variables: variables[index],
				},
				config,
			);

			arrResponse.push({
				orderID: variables[index].orderID,
				...result.data,
			});

			console.log(
				`${parseFloat(num).toFixed(2)}% => {ID: ${
					variables[index].orderID
				} - Status: ${result.data.errors ? "Error" : "Done"}}`,
			);
		} catch (e) {
			console.error(e);
		}
	}

	fs.writeFileSync("./result.log", JSON.stringify(arrResponse, null, 4));
};

const variables = ordersID.map((id) => {
	return {
		orderID: id,
		dataUpdOrder: {
			statusID: 166,
			incidenceID: null,
		},
	};
});

run(variables);
