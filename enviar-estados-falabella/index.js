const runTableIntegrationLogs = require("./tableIntegrationLogs");
const runTableOrders = require("./tableOrders");
const { TIME_INTERVAL } = require("./generalConst");

const run = async () => {
	const date = new Date();
	console.log(
		date.toLocaleString(),
		"=> INICIO DE PROCESO DE ENVIO DE ESTADOS DE FALABELLA",
	);

	try {
		await runTableIntegrationLogs(date);
		await runTableOrders(date);
	} catch (error) {
		console.error(error);
	}

	console.log(new Date().toLocaleString(), "=> PROCESO FINALIZADO");
};

run();

setInterval(() => {
	run();
}, TIME_INTERVAL * 60 * 1000);
