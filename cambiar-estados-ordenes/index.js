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
	979684, 938449, 948034, 972923, 927828, 919737, 921511, 939025, 936447,
	936730, 936596, 939262, 946382, 947838, 957518, 947958, 947840, 946340,
	947961, 947839, 947842, 946697, 946468, 959408, 963499, 958821, 962811,
	966572, 966323, 972247, 979858, 992545, 1002787, 1008622, 1008700,
];

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
