const fs = require("fs");
const dayjs = require("dayjs");
const ObjectsToCsv = require("objects-to-csv");
const REVIEW_TIME = dayjs(process.env.REVIEW_TIME);
const { newClientNintendo } = require("./db");
const { queryGetOrderServiceHistorial } = require("./querys");

function renderDate(DateRequest, hourSubtract = 5) {
	const date = dayjs(DateRequest)
		.subtract(hourSubtract, "h")
		.toDate()
		.toString();
	return date;
}

function addValidDate(arr = []) {
	return arr.map((e) => {
		const date = dayjs(e.DateRequest);
		const isValid = date.isBefore(REVIEW_TIME) || date.isSame(REVIEW_TIME);
		return { ...e, ValidDate: isValid };
	});
}

async function getOrderServiceHistorial(trackCode) {
	const data = [];
	try {
		const client = newClientNintendo();
		try {
			await client.connect();
			const historial = await client.query(
				queryGetOrderServiceHistorial(trackCode),
			);
			data.push(...historial.rows);
		} catch (error) {
			console.error({ function: "getOrderServiceHistorial => client", error });
		} finally {
			await client.end();
		}
	} catch (error) {
		console.error({ function: "getOrderServiceHistorial", error });
	}

	return data.map((f) => {
		return {
			...f,
			createdAt: renderDate(f.createdAt, 0),
		};
	});
}

function groupTrackCodes(arr = []) {
	const tmp = [];

	arr.forEach((e) => {
		const body = { ...e };
		delete body.TrackCode;

		const pos = tmp.findIndex((f) => f.TrackCode === e.TrackCode);
		if (pos === -1) {
			tmp.push({ TrackCode: e.TrackCode, StatusHistorial: [body] });
		} else {
			tmp[pos].StatusHistorial.push(body);
		}
	});

	return tmp;
}

async function addOrderServiceHistorial(arr = []) {
	return await Promise.all(
		arr.map(async (e) => {
			return {
				...e,
				OrderServiceHistorial: await getOrderServiceHistorial(e.TrackCode),
			};
		}),
	);
}

function generateLog(fileName, arr) {
	fs.writeFileSync("./logs/" + fileName, JSON.stringify(arr, null, 2));
}

async function generateLogWithOrderServiceHistorial(fileName, arr) {
	const res = await addOrderServiceHistorial(arr);
	generateLog(fileName, res);
	return res;
}

function deleteInfoRequest(arr) {
	return arr.map((e) => {
		delete e.InfoRequest;
		return e;
	});
}

async function generateCSV(result) {
	const data = result
		.map((e) => {
			return e.StatusHistorial.map((s) => {
				const orderServiceHistorial = e.OrderServiceHistorial.find(
					(o) => o.falabellaStatusCode == s.StatusOrderSend,
				);

				const infoResponse = JSON.parse(s.InfoResponse);
				const body = {
					TrackCode: e.TrackCode,
					StatusOrderSend: s.StatusOrderSend,
					DateRequest: s.DateRequest,
					DateNintendo: orderServiceHistorial?.createdAt,
					InfoResponseCode: infoResponse.code,
					InfoResponseMessage: infoResponse.message,
					InfoResponseErrors: infoResponse.errors,
					StatusResponse: s.StatusResponse,
					ValidDate: String(s.ValidDate),
				};

				return body;
			});
		})
		.flat(1);

	const csv = new ObjectsToCsv(data);
	const csvString = (await csv.toString()).replaceAll(",", ";");
	fs.writeFile("./logs/result.csv", csvString, "utf-8", (err) => {
		if (err) console.log(err);
	});
}

module.exports = {
	addValidDate,
	groupTrackCodes,
	addOrderServiceHistorial,
	generateLog,
	renderDate,
	generateLogWithOrderServiceHistorial,
	deleteInfoRequest,
	generateCSV,
};
