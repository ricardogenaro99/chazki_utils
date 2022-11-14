const { Client } = require("pg");

const confNintendo = {
	user: process.env.NINTENDO_USER,
	password: process.env.NINTENDO_PASSWORD,
	host: process.env.NINTENDO_HOST,
	database: process.env.NINTENDO_NAME,
	port: 5432,
};

const confSonic = {
	user: process.env.SONIC_USER,
	password: process.env.SONIC_PASSWORD,
	host: process.env.SONIC_HOST,
	database: process.env.SONIC_NAME,
	port: 5432,
};

const clientSonic = new Client(confSonic);
const clientNintendo = new Client(confNintendo);

const newClientSonic = () => new Client(confSonic);
const newClientNintendo = () => new Client(confNintendo);

module.exports = {
	clientNintendo,
	clientSonic,
	newClientSonic,
	newClientNintendo,
};
