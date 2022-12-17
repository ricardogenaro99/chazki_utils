const { newClientNintendo } = require("./db");
const { queryGetTrackCodesFromOrders } = require("./querys");
const {
	sendOrders,
	generateArrDoneError,
	generateLog,
} = require("./generalFunctions");

let DATA = [];
let arrResponse = [];
let arrLastResponse = [];

const getData = async () => {
	try {
		const client = newClientNintendo();
		try {
			console.log("Trayendo ordenes de Orders...");
			await client.connect();
			const trackCodes = await client.query(queryGetTrackCodesFromOrders());
			DATA.push(...trackCodes.rows);
		} catch (error) {
			console.error({ function: "getData => client", error });
		} finally {
			console.log("Cerrando cliente de Orders...");
			await client.end();
		}
	} catch (error) {
		console.error({ function: "getData", error });
	}
};

const runTableOrders = async (date) => {
	console.log(
		new Date().toLocaleString(),
		"=> Inicio de proceso en tabla Orders",
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

	generateLog(`./logs/Orders/result.log`, arrResponse);
	generateLog(`./logs/Orders/result-${name}.log`, arrLastResponse);
	generateLog(`./logs/Orders/done-${name}.log`, arrLastDone);
	generateLog(`./logs/Orders/error-${name}.log`, arrLastError);

	console.log(
		new Date().toLocaleString(),
		"=> Proceso finalizado en tabla Orders",
	);
};

module.exports = runTableOrders;
