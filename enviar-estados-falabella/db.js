const { Client } = require("pg");

const confNintendo = {
	user: process.env.NINTENDO_USER,
	password: process.env.NINTENDO_PASSWORD,
	host: process.env.NINTENDO_HOST,
	database: process.env.NINTENDO_NAME,
	port: 5432,
};

const confNintendoData = {
	user: process.env.NINTENDO_USER,
	password: process.env.NINTENDO_PASSWORD,
	host: process.env.NINTENDO_HOST,
	database: process.env.NINTENDO_NAME,
	port: 5432,
};

const newClientNintendo = () => new Client(confNintendo);
const newClientNintendoData = () => new Client(confNintendoData);

module.exports = {
	newClientNintendo,
	newClientNintendoData
};
