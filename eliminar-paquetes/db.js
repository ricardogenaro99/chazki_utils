const { Client } = require('pg');

const connectionData = {
  user:   process.env.USER,
  password: process.env.PASSWORD,
  host: process.env.HOST,
  database: process.env.NAME,
  port: 5432,
}
const client = new Client(connectionData)

module.exports = client