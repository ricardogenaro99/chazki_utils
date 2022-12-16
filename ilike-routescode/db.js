const { Client } = require("pg");

const connectionData = {
	user: process.env.NINTENDO_USER,
	password: process.env.NINTENDO_PASSWORD,
	host: process.env.NINTENDO_HOST,
	database: process.env.NINTENDO_NAME,
	port: 5432,
};
const client = new Client(connectionData);

module.exports = client;
