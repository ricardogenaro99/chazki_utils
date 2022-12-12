const bigQuery = require("./bigQuery.json");

const lastOrdersSend = [];

const bigQueryTmp = bigQuery.map((e) => {
	const InfoRequest = JSON.parse(e.InfoRequest);
	return {
		...e,
		InfoRequest,
	};
});

bigQueryTmp.forEach((e) => {
	const pos = lastOrdersSend.findIndex(
		(e_tmp) => e_tmp.TrackCode === e.TrackCode,
	);

	if (pos === -1) {
		lastOrdersSend.push(e);
		return;
	}

	if (new Date(lastOrdersSend[pos].DateRequest) > new Date(e.DateRequest)) {
		return;
	}

	lastOrdersSend[pos] = { ...e };
});

const resumen = lastOrdersSend.map((e) => {
	return {
		TrackCode: e.TrackCode,
		LastStatusCodeSend: e.InfoRequest.status.code,
		DateRequest: e.DateRequest,
		StatusResponse: e.StatusResponse,
	};
});

const code_99 = resumen.filter((e) => e.LastStatusCodeSend === 99);
const code_1026 = resumen.filter((e) => e.LastStatusCodeSend === 1026);

console.log(code_99.length, code_1026.length);
