require("dotenv").config();
const { clientNintendo, clientSonic } = require("./db");
const {
	queryCountOrders,
	queryCountOriginalOrders,
	queryUpdateOrder,
	queryUpdateOriginalOrder,
} = require("./querys");

const ordersID = [];
const originalOrdersID = [];

const runCount = async () => {
	try {
		await clientSonic.connect();
		const rowsOrdersID = await clientSonic.query(queryCountOrders());
		const rowsOriginalOrdersID = await clientSonic.query(
			queryCountOriginalOrders(),
		);

		ordersID.push(...rowsOrdersID.rows.map((e) => e.id));
		originalOrdersID.push(...rowsOriginalOrdersID.rows.map((e) => e.id));
	} catch (error) {
		console.error({ function: "runCount", error });
	} finally {
		clientSonic.end();
	}
};

const runUpdate = async (data, queryUpdate) => {
	try {
		console.log(`=> Length: ${data.length}`);
		const resUpdate = await data.map(async (id) =>
			clientNintendo.query(queryUpdate(id)),
		);
		await Promise.all(resUpdate);
	} catch (error) {
		console.error({ function: "runUpdate", error });
	}
};

const run = async () => {
	try {
		console.log(`\n### Starting process (${new Date()})`);
		console.log("Searching records in Sonic...");
		await runCount();
		if (ordersID.length === 0 && originalOrdersID.length === 0) {
			console.log("No records found");
			return;
		}
		try {
			await clientNintendo.connect();
			if (ordersID.length > 0) {
				console.log("Update Orders in Nintendo...");
				await runUpdate(ordersID, queryUpdateOrder);
			}
			if (originalOrdersID.length > 0) {
				console.log("Update OriginalOrders in Nintendo...");
				await runUpdate(originalOrdersID, queryUpdateOriginalOrder);
			}
		} catch (error) {
			console.error({ function: "run => block updates", error });
		} finally {
			clientNintendo.end();
		}
	} catch (error) {
		console.error({ function: "run", error });
	}
};

run();
setInterval(() => {
	run();
}, 10 * 60 * 1000 );
