require("dotenv").config();
const fs = require("fs");
const DATA = require("./data.json");
const axios = require("axios").default;

const urlWebHook = process.env.URL || "";
const token = process.env.BEARER || "";

const body = DATA.map((item) => {
	return {
		delivery_code: item.delivery_code,
		delivery_status: item.delivery_status,
		timestamp: item.timestamp,
		url_delivery_code: item.url_delivery_code,
	};
});

const config = {
	headers: {
		"Content-type": "application/json",
		Authorization: token,
		// Añadir los hooksHeaders de la empresa
		"x-api-key": "ens5oz149D3e9BQWe2dyhaWGI3jyyuTH9A8j9jW1"	
	},
};

const enviar = async (body, arrData) => {
	const arrResponse = [];

	for (let index in body) {
		const num = ((Number(index) + 1) * 100) / body.length;
		try {
			const result = await axios.post(urlWebHook, body[index], config);

			arrResponse.push({
				trackcode: body[index].delivery_code,
				response: result.data,
			});

			console.log(
				`${parseFloat(num).toFixed(4)}% => {Trackcode: ${
					body[index].delivery_code
				}, Status: ${result.data.errorMessage ? "Error" : "Done"}}`,
			);
		} catch (e) {
			console.error(e);
		}
	}

	fs.writeFileSync("./result.log", JSON.stringify(arrResponse, null, 4));
};

enviar(body, DATA);
