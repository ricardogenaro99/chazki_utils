const fs = require("fs");
const axios = require("axios");
const { FUNCTION_URL } = require("./generalConst");

const config = {
	headers: {
		"Content-type": "application/json",
	},
};

const contador = (num, order, status) => {
	if (typeof order === "object") {
		console.log(
			`${parseFloat(num).toFixed(4)}% => {Order: ${
				order.trackCode
			}, StatusIDSend: ${order.statusID}, Status: ${status}}`,
		);
	} else {
		console.log(
			`${parseFloat(num).toFixed(4)}% => {Order: ${order}, Status: ${status}}`,
		);
	}
};

const sendOrders = async (orders = [], arrResponse, arrLastResponse) => {
	console.log("Ordenes a enviar =>", orders.length);
	let status = "";
	let response = "";

	for (let index in orders) {
		const num = (Number(index) * 100 + 100) / orders.length;
		try {
			const result = await axios.post(
				FUNCTION_URL,
				{ trackCodes: orders[index].trackCode },
				config,
			);
			status = "Done";
			response = { status: result.status, data: result.data };
		} catch (error) {
			status = "Error";
			response = error.response ? error.response.data : "Internal error";
		} finally {
			const res = {
				status,
				order: orders[index].trackCode,
				statusIDSend: orders[index].statusID,
				response,
				date: new Date().toLocaleString(),
			};
			arrResponse.push(res);
			arrLastResponse.push(res);
			contador(num, orders[index], status);
		}
	}
};

const generateArrDoneError = (arr, status) => {
	return [
		...new Set(arr.filter((e) => e.status === status).map((e) => e.order)),
	];
};

const generateLog = (fullName, arrData) => {
	fs.writeFileSync(fullName, JSON.stringify(arrData, null, 2));
};

module.exports = { sendOrders, generateArrDoneError, generateLog, contador };
