require("dotenv").config();
const fs = require("fs");
const querys = require("./querys.js");
const axios = require('axios');

const urlBackend = process.env.BACKEND || "";
const token = process.env.BEARER || "";

const config = {
	headers: {
		"Content-type": "application/json",
		Authorization: token,
	},
};

const routesID = [
	47063, 47105, 47652, 51059, 51065, 51070, 51077, 51242, 51832, 52155, 52160,
	52282, 52304, 52424, 52660, 52662, 52684, 52687, 52856, 53221, 53617, 54055,
	54057, 54413, 54414, 54416, 54420, 54423, 54426, 54428, 54438, 54627, 55385,
	55389, 55392, 55393, 55419, 55420, 55421, 55424, 56798, 56808, 57001, 57005,
	57008, 57011, 57019, 57021, 57023, 57028, 57072, 57076, 57080, 57081, 57083,
	57086, 57087, 57089, 57091, 57092, 57093, 57103, 57104, 57105, 57106, 57108,
	57109, 59021, 59545, 59601, 59603, 59769, 59901, 59910, 59928,
];

const variables = routesID.map((id) => {
	return {
		routeID: id,
	};
});

const run = async (variables) => {
	const arrResponse = [];

	for (let index in variables) {
		const num = (Number(index) * 100 + 100) / variables.length;
		try {
			const result = await axios.post(
				urlBackend,
				{
					query: querys.deleteRoute,
					variables: variables[index],
				},
				config,
			);

			arrResponse.push({
				routeID: variables[index].routeID,
				response: result.data,
			});

			console.log(
				`${parseFloat(num).toFixed(2)}% => {ID: ${
					variables[index].routeID
				}, Status: ${result.data.errors ? "Error" : "Done"}}`,
			);
		} catch (e) {
			console.error(e);
		}
	}

	fs.writeFileSync("./result.log", JSON.stringify(arrResponse, null, 4));
};

run(variables);
