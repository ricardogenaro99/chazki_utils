require("dotenv").config();
const {
	// clientNintendo,
	// clientSonic,
	newClientSonic,
	newClientNintendo,
} = require("./db");
const {
	queryCountOrders,
	queryCountOriginalOrders,
	queryUpdateOrder,
	queryUpdateOriginalOrder,
} = require("./querys");

const ordersID = [];
const originalOrdersID = [];

let clientNintendo = null;
let clientSonic = null;

const runCount = async () => {
	try {
		clientSonic = newClientSonic();
		try {
			console.log("=> Connect client Sonic...");
			await clientSonic.connect();
			const rowsOrdersID = await clientSonic.query(queryCountOrders());
			const rowsOriginalOrdersID = await clientSonic.query(
				queryCountOriginalOrders(),
			);

			ordersID.push(...rowsOrdersID.rows.map((e) => e.id));
			originalOrdersID.push(...rowsOriginalOrdersID.rows.map((e) => e.id));
		} catch (error) {
			console.error({ function: "runCount => client", error });
		} finally {
			console.log("=> End client Sonic...");
			await clientSonic.end();
		}
	} catch (error) {
		console.error({ function: "runCount", error });
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
			clientNintendo = newClientNintendo();
			try {
				console.log("=> Connect client Nintendo...");
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
				console.error({ function: "run => client => block updates", error });
			} finally {
				console.log("=> End client Nintendo...");
				await clientNintendo.end();
			}
		} catch (error) {
			console.error({ function: "run => client", error });
		}
	} catch (error) {
		console.error({ function: "run", error });
	}
};

run();

setInterval(() => {
	run();
}, 15 * 60 * 1000);
