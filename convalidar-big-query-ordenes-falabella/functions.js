const fs = require("fs");
const dayjs = require("dayjs");
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
			updatedAt: renderDate(f.updatedAt, 0),
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

function generateLog(fullName, arrData) {
	fs.writeFileSync(fullName, JSON.stringify(arrData, null, 2));
}

module.exports = {
	addValidDate,
	groupTrackCodes,
	addOrderServiceHistorial,
	generateLog,
};
