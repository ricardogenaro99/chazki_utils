require("dotenv").config();
const querys = require("./querys.js");
const axios = require("axios").default;

const token = process.env.BEARER || "";

const config = {
	headers: {
		"Content-type": "application/json",
		Authorization: token,
	},
};

const OrderID = [
	452603,
];

const run = async (variables) => {
	try {
		for (let index in variables) {
			const result = await axios.post(
				process.env.BACKEND,
				{
					query: querys.updateOrderData,
					variables: variables[index],
				},
				config,
			);

			const num = (Number(index) * 100 + 100) / variables.length;
			console.log(
				"Status: " +
					result.status +
					" porcentaje: " +
					parseFloat(num).toFixed(2) +
					"%" +
					" ID: " +
					variables[index].orderID,
			);
		}
	} catch (e) {
		console.log(e.message);
	}
};

const variables = OrderID.map((id) => {
	return {
		orderID: id,
		dataUpdOrder: {
			statusID: 166,
			incidenceID: null,
		},
	};
});

run(variables);
