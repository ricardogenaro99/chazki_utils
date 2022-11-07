require("dotenv").config();
const fs = require("fs");
const client = require("./db");
const query = require("./querys");
const { trackcodes } = require("./data");

const arrResult = {
	response: [],
	responseError: [],
	generalError: [],
};

const DATA = trackcodes.map((e) => {
	// RECUERDEN CAMBIAR EL WAREHOUSEID, ENTERPRISEID Y CITYID SEGUN LO QUE NECESITEN
	return { warehouseID: 0, enterpriseId: 0, trackcode: e, cityID: 0 };
});

const run = async () => {
	try {
		console.info("Size =>", DATA.length);
		client.connect();
		DATA.forEach(async (element, index) => {
			try {
				await client.query(query(element)).then((result) => {
					const num = (Number(index) * 100 + 100) / DATA.length;
					const msg =
						"Status: " +
						result.command +
						" " +
						result.rowCount +
						" porcentaje: " +
						parseFloat(num).toFixed(4) +
						"%" +
						" Trackcode: " +
						element.trackcode;

					console.log(msg);
					arrResult.response.push({ index, msg });
				});
			} catch (error) {
				arrResult.responseError.push({ element, error });
				fs.writeFileSync("response.log", JSON.stringify(arrResult, null, 2));
			}
		});
	} catch (error) {
		arrResult.generalError.push({ error });
		fs.writeFileSync("response.log", JSON.stringify(arrResult, null, 2));
	}
};

run();
