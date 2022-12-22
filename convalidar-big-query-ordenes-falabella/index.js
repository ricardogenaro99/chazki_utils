require("dotenv").config();
const {
	addValidDate,
	groupTrackCodes,
	generateLog,
	renderDate,
	generateLogWithOrderServiceHistorial,
	deleteInfoRequest,
} = require("./functions");
const dataBigQuery = require("./dataBigQuery");

const dataParse = dataBigQuery.map(
	({ TrackCode, DateRequest, InfoRequest, InfoResponse, StatusResponse }) => {
		const DateRequestParse = renderDate(DateRequest);
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

const run = async () => {
	try {
		const dataResumenValidDate = addValidDate(dataParse);

		const dataResumenErrorsValidDate = dataResumenValidDate.filter(
			(e) => e.StatusResponse !== "200",
		);
		const dataResumenSuccessValidDate = dataResumenValidDate.filter(
			(e) => e.StatusResponse === "200",
		);

		generateLog(
			"resultErrors.log",
			groupTrackCodes(dataResumenErrorsValidDate),
		);

		await generateLogWithOrderServiceHistorial(
			"result.log",
			groupTrackCodes(deleteInfoRequest(dataResumenValidDate)),
		);

		generateLog(
			"resultSuccess.log",
			groupTrackCodes(deleteInfoRequest(dataResumenSuccessValidDate)),
		);
	} catch (error) {
		console.error(error);
	}
};

run();
