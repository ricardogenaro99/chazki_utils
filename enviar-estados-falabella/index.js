require("dotenv").config();
const axios = require("axios");
const fs = require("fs");
const DATA_ESTATIC = require("./data");
const { newClientNintendo } = require("./db");
const { queryUpdateIntegrationLogs, queryGetOrders } = require("./querys");

let DATA = [];
let arrResponse = [];
let arrLastResponse = [];

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
		const client = newClientNintendo();
		try {
			console.log("Trayendo ordenes de IntegrationLogs...");
			await client.connect();
			const trackCodes = await client.query(queryGetOrders());
			DATA.push(...trackCodes.rows.map((e) => e.trackCode));
		} catch (error) {
			console.error({ function: "getData => client", error });
		} finally {
			console.log("Cerrando cliente de IntegracionLogs...");
			await client.end();
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
	let response = "";

	for (let index in orders) {
		const num = (Number(index) * 100 + 100) / orders.length;
		try {
			const result = await axios.post(
				URL,
				{ trackCodes: orders[index] },
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
				order: orders[index],
				response,
				date: new Date().toLocaleString(),
			};
			arrResponse.push(res);
			arrLastResponse.push(res);
			contador(num, orders[index], status);
		}
	}
};

const updateIntegrationLogs = async (orders, queryUpdate) => {
	console.log("Actualizar tabla IntegrationLogs =>", orders.length);
	const client = newClientNintendo();
	try {
		await client.connect();
		let status = "";
		for (let index in orders) {
			const num = (Number(index) * 100 + 100) / orders.length;
			try {
				await client.query(queryUpdate(orders[index]));
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
		client.end();
	}
};

const generateArrDoneError = (arr, status) => {
	return [
		...new Set(arr.filter((e) => e.status === status).map((e) => e.order)),
	];
};

const run = async () => {
	console.log(
		new Date().toLocaleString(),
		"=> Inicio de proceso de envio de estados de Falabella",
	);

	arrLastResponse = [];

	if (DATA_ESTATIC.length === 0) await getData();
	else DATA = DATA_ESTATIC;

	console.log("Se encontraron", DATA.length, "ordenes");

	if (DATA.length !== 0) {
		await sendOrders(DATA);
	}

	const arrLastDone = generateArrDoneError(arrLastResponse, "Done");
	const arrLastError = generateArrDoneError(arrLastResponse, "Error");

	await fs.writeFileSync("./logs/result.log", JSON.stringify(arrResponse, null, 2));
	await fs.writeFileSync("./logs/done.log", JSON.stringify(arrLastDone, null, 2));
	await fs.writeFileSync("./logs/error.log", JSON.stringify(arrLastError, null, 2));

	if (arrLastDone.length > 0) {
		await updateIntegrationLogs(arrLastDone, queryUpdateIntegrationLogs);
	}

	console.log(new Date().toLocaleString(), "=> Proceso finalizado");
};

run();

setInterval(() => {
	run();
}, 10 * 60 * 1000);
