const { newClientNintendo } = require("./db");
const {
	queryUpdateIntegrationLogs,
	queryGetTrackCodesFromIntegrationLogs,
} = require("./querys");
const {
	sendOrders,
	generateArrDoneError,
	generateLog,
	contador,
} = require("./generalFunctions");

let DATA = [];
let arrResponse = [];
let arrLastResponse = [];

const getData = async () => {
	try {
		const client = newClientNintendo();
		try {
			console.log("Trayendo ordenes de IntegrationLogs...");
			await client.connect();
			const trackCodes = await client.query(
				queryGetTrackCodesFromIntegrationLogs(),
			);
			DATA.push(...trackCodes.rows);
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

const runTableIntegrationLogs = async (date) => {
	console.log(
		new Date().toLocaleString(),
		"=> Inicio de proceso en tabla IntegrationLogs",
	);

	arrLastResponse = [];
	DATA = [];

	await getData();

	console.log("Se encontraron", DATA.length, "ordenes");

	if (DATA.length !== 0) {
		await sendOrders(DATA, arrResponse, arrLastResponse);
	}

	const arrLastDone = generateArrDoneError(arrLastResponse, "Done");
	const arrLastError = generateArrDoneError(arrLastResponse, "Error");

	const nameDate = date.toLocaleDateString()
		.split("/")
		.reverse()
		.join(".");
	const nameTime = date.toLocaleTimeString().replaceAll(":", ".");

	const name = nameDate + "-" + nameTime;

	generateLog(`./logs/IntegrationLogs/result.log`, arrResponse);
	generateLog(`./logs/IntegrationLogs/result-${name}.log`, arrLastResponse);
	generateLog(`./logs/IntegrationLogs/done-${name}.log`, arrLastDone);
	generateLog(`./logs/IntegrationLogs/error-${name}.log`, arrLastError);

	if (arrLastDone.length > 0) {
		await updateIntegrationLogs(arrLastDone, queryUpdateIntegrationLogs);
	}

	console.log(
		new Date().toLocaleString(),
		"=> Proceso finalizado en tabla IntegrationLogs",
	);
};

module.exports = runTableIntegrationLogs;
