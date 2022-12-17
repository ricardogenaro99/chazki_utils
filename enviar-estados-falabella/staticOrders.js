const DATA_ESTATIC = require("./data");
const {
	sendOrders,
	generateArrDoneError,
	generateLog,
} = require("./generalFunctions");

let DATA = [];
let arrResponse = [];
let arrLastResponse = [];

const runStaticOrders = async (date) => {
	console.log(
		new Date().toLocaleString(),
		"=> Inicio de proceso de Ordenes estaticas",
	);

	arrLastResponse = [];
	DATA = DATA_ESTATIC;

	console.log("Se encontraron", DATA.length, "ordenes");

	await sendOrders(DATA, arrResponse, arrLastResponse);

	const arrLastDone = generateArrDoneError(arrLastResponse, "Done");
	const arrLastError = generateArrDoneError(arrLastResponse, "Error");

	const nameDate = date.toLocaleDateString().split("/").reverse().join(".");
	const nameTime = date.toLocaleTimeString().replaceAll(":", ".");

	const name = nameDate + "-" + nameTime;

	generateLog(`./logs/Static/result.log`, arrResponse);
	generateLog(`./logs/Static/result-${name}.log`, arrLastResponse);
	generateLog(`./logs/Static/done-${name}.log`, arrLastDone);
	generateLog(`./logs/Static/error-${name}.log`, arrLastError);

	console.log(
		new Date().toLocaleString(),
		"=> Proceso finalizado de Ordenes estaticas",
	);
};

module.exports = runStaticOrders;
