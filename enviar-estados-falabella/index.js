const runTableIntegrationLogs = require("./tableIntegrationLogs");
const runTableOrders = require("./tableOrders");
const runStaticOrders = require("./staticOrders");
const { TIME_INTERVAL } = require("./generalConst");
const DATA_ESTATIC = require("./data");

const run = async () => {
	const date = new Date();
	console.log(
		date.toLocaleString(),
		"=> INICIO DE PROCESO DE ENVIO DE ESTADOS DE FALABELLA",
	);

	try {
		if (DATA_ESTATIC.length === 0) {
			await runTableIntegrationLogs(date);
			// // await runTableOrders(date);
		} else {
			await runStaticOrders(date);
		}
	} catch (error) {
		console.error(error);
	}

	console.log(new Date().toLocaleString(), "=> PROCESO FINALIZADO");
};

run();

if (DATA_ESTATIC.length === 0) {
	setInterval(() => {
		run();
	}, TIME_INTERVAL * 60 * 1000);
}
