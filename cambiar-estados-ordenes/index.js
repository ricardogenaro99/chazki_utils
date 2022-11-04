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

const ordersID = [
	1168335, 1168348, 1172469, 1172825, 1172876, 1172877, 1172879, 1172884,
	1172940, 1172966, 1173038, 1173059, 1173131, 1173144, 1173159, 1173181,
	1173285, 1173294, 1173299, 1173301, 1173302, 1173353, 1173354, 1173359,
	1173421, 1173425, 1173472, 1174072, 1174163, 1174280, 1174662, 1175274,
];

const variables = ordersID.map((id) => {
	return {
		orderID: id,
		dataUpdOrder: {
			statusID: 169,
			incidenceID: 26,
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
				`${parseFloat(num).toFixed(2)}% => {ID: ${
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
