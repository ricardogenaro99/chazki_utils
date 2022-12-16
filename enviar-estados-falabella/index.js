const runTableIntegrationLogs = require("./tableIntegrationLogs");
const runTableOrders = require("./tableOrders");
const { TIME_INTERVAL } = require("./generalConst");
let { EXECUTION_DATE } = require("./generalConst");

const run = async () => {
	EXECUTION_DATE = new Date();
	console.log(
		EXECUTION_DATE.toLocaleString(),
		"=> INICIO DE PROCESO DE ENVIO DE ESTADOS DE FALABELLA",
	);

	try {
		await runTableIntegrationLogs();
		await runTableOrders();
	} catch (error) {
		console.error(error);
	}

	console.log(new Date().toLocaleString(), "=> PROCESO FINALIZADO");
};

run();

setInterval(() => {
	run();
}, TIME_INTERVAL * 60 * 1000);
