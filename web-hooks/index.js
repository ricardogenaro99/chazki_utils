require("dotenv").config();
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
	},
};

const enviar = async (body, arrData) => {
	try {
		for (let index in body) {
			const result = await axios.post(urlWebHook, body[index], config);
			const num = ((Number(index) + 1) * 100) / body.length;
			let fixedNum = parseFloat(num).toFixed(2);
			console.log(
				"Status: " +
					result.status +
					" Trackcode: " +
					body[index].delivery_code +
					" Progress: " +
					fixedNum +
					"%",
			);
		}
	} catch (e) {
		console.log(e.message);
	}
};

// enviar(body, DATA);
