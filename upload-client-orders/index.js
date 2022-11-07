const fs = require("fs");
const DATA = require("./data.json");
const axios = require("axios");

const URL =
	"https://us-central1-chazki-link.cloudfunctions.net/uploadClientOrders";

const tmp = [];

DATA.forEach((e) => {
	const pos = tmp.findIndex((e_tmp) => e_tmp.Trackcode === e.Trackcode);

	if (pos === -1) {
		tmp.push(e);
		return;
	}

	if (new Date(tmp[pos].DateRequest) > new Date(e.DateRequest)) {
		return;
	}

	tmp[pos] = { ...e };
});

const body = tmp.map((item) => {
	const order = JSON.parse(item.Info);

	const tmp = {
		enterpriseKey: item.EnterpriseKey,
		orders: {
			...order,
		},
	}

	delete tmp.orders.pickUpPoint

	return tmp;
});

const enviar = async (body) => {
	const arrResponse = [];

	const config = {
		headers: {
			"Content-type": "application/json",
		},
	};

	for (let index in body) {
		const num = ((Number(index) + 1) * 100) / body.length;
		try {
			const result = await axios.post(URL, body[index], config);

			arrResponse.push({
				trackcode: body[index].orders.trackCode,
				response: result.data,
			});

			console.log(
				`${parseFloat(num).toFixed(4)}% => {Trackcode: ${
					body[index].orders.trackCode
				}, Status: ${result.data.errorMessage ? "Error" : "Done"}}`,
			);
		} catch (e) {
			console.error(e);
		}
	}

	fs.writeFileSync("./result.log", JSON.stringify(arrResponse, null, 4));
};

enviar(body);
