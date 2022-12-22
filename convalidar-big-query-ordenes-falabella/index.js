require("dotenv").config();
const dayjs = require("dayjs");
const {
	addValidDate,
	groupTrackCodes,
	addOrderServiceHistorial,
	generateLog,
} = require("./functions");
const dataBigQuery = require("./dataBigQuery");

const dataParse = dataBigQuery.map(
	({ TrackCode, DateRequest, InfoRequest, InfoResponse, StatusResponse }) => {
		const DateRequestParse = dayjs(DateRequest)
			.subtract(5, "h")
			.toDate()
			.toString();

		const InfoRequestParse = JSON.parse(InfoRequest);

		return {
			TrackCode,
			DateRequestGCP: DateRequest,
			DateRequest: DateRequestParse,
			InfoRequest: InfoRequestParse,
			InfoResponse,
			StatusResponse,
			StatusOrderSend: InfoRequestParse.status.code,
		};
	},
);

// // const dataResumenErrors = [];
// // const dataResumenSuccess = [];

const dataResumen = dataParse.map((e) => {
	// // const InfoRequest = { ...e.InfoRequest };
	delete e.InfoRequest;
	// // if (e.StatusResponse !== "200") dataResumenErrors.push({ ...e, InfoRequest });
	// // else dataResumenSuccess.push(e);
	return e;
});

const dataResumenDateReq = addValidDate(dataResumen);

// // groupTrackCodes(dataResumenDateReq)

addOrderServiceHistorial(groupTrackCodes(dataResumenDateReq))
	.then((e) => generateLog("result.log", e))
	.catch((error) => console.error(error));
