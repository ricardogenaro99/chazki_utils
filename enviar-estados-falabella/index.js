require("dotenv").config();
const axios = require("axios");
const fs = require("fs");
const DATA_ESTATIC = require("./data");
const { newClientNintendo, newClientNintendoData } = require("./db");
const { queryUpdateIntegrationLogs, queryCountOrders } = require("./querys");

let DATA = [];
let arrResponse = [];

// const URL =
// 	"http://localhost:5001/chazki-link/us-central1/fnReintentFalabellaOrders";
const URL =
	"https://us-central1-chazki-link.cloudfunctions.net/fnReintentFalabellaOrders";

const config = {
	headers: {
		"Content-type": "application/json",
	},
};

const getData = async () => {
	try {
		const clientNintendoData = newClientNintendoData();
		try {
			console.log("Trayendo ordenes de IntegrationLogs...");
			await clientNintendoData.connect();
			const trackCodes = await clientNintendoData.query(queryCountOrders());
			DATA.push(...trackCodes.rows.map((e) => e.trackCode));
		} catch (error) {
			console.error({ function: "getData => client", error });
		} finally {
			console.log("Cerrando cliente de IntegracionLogs...");
			await clientNintendoData.end();
		}
	} catch (error) {
		console.error({ function: "getData", error });
	}
};

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
	console.log(
		new Date(),
		"=> Inicio de proceso de envio de estados de Falabella",
	);
	arrResponse = [];
	if (DATA_ESTATIC.length === 0) {
		await getData();
	} else {
		DATA = DATA_ESTATIC;
	}
	console.log("Se encontraron", DATA.length, "ordenes");
	if (DATA.length !== 0) {
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
	}
	console.log(new Date(), "=> Proceso finalizado");
};

run();

setInterval(() => {
	run();
}, 15 * 60 * 1000);
