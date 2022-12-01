require("dotenv").config();
const axios = require("axios");
const fs = require("fs");
const DATA = require("./data");
const { newClientNintendo } = require("./db");
const { queryUpdateIntegrationLogs } = require("./querys");

const URL =
	"http://localhost:5001/chazki-link/us-central1/fnReintentFalabellaOrders";

const config = {
	headers: {
		"Content-type": "application/json",
	},
};

const arrResponse = [];

const contador = (num, order, status) => {
	console.log(
		`${parseFloat(num).toFixed(4)}% => {Order: ${order}, Status: ${status}}`,
	);
};

const sendOrders = async (orders = []) => {
	console.log("Ordenes a enviar =>", orders.length);
	let status = "";

	for (let index in orders) {
		const num = (Number(index) * 100 + 100) / orders.length;
		try {
			const result = await axios.post(
				URL,
				{ trackCodes: orders[index] },
				config,
			);
			status = "Done";
			arrResponse.push({
				status,
				order: orders[index],
				response: { status: result.status, data: result.data },
			});
		} catch (error) {
			status = "Error";
			arrResponse.push({
				status,
				order: orders[index],
				response: error.response ? error.response.data : "Internal error",
			});
		} finally {
			contador(num, orders[index], status);
		}
	}
	await fs.writeFileSync(
		"./logs/result.log",
		JSON.stringify(arrResponse, null, 2),
	);
};

const updateIntegrationLogs = async (orders, queryUpdate) => {
	console.log("Actualizar tabla IntegrationLogs =>", orders.length);
	const clientNintendo = newClientNintendo();
	try {
		await clientNintendo.connect();
		let status = "";
		for (let index in orders) {
			const num = (Number(index) * 100 + 100) / orders.length;
			try {
				await clientNintendo.query(queryUpdate(orders[index]));
				status = "Done";
			} catch (error) {
				status = "Error";
				console.error(error);
			} finally {
				contador(num, orders[index], status);
			}
		}
	} catch (error) {
		console.error(error);
	} finally {
		clientNintendo.end();
	}
};

const run = async () => {
	await sendOrders(DATA);
	const arrDone = arrResponse
		.filter((e) => e.status === "Done")
		.map((e) => e.order);

	const arrError = arrResponse
		.filter((e) => e.status === "Error")
		.map((e) => e.order);

	fs.writeFileSync("./logs/done.log", JSON.stringify(arrDone, null, 2));
	fs.writeFileSync("./logs/error.log", JSON.stringify(arrError, null, 2));

	if (arrDone.length > 0) {
		await updateIntegrationLogs(arrDone, queryUpdateIntegrationLogs);
	}
};

run();
