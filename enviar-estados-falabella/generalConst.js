// const FUNCTION_URL =
// 	"http://localhost:5001/chazki-link/us-central1/fnReintentFalabellaOrders";
const FUNCTION_URL =
	"https://us-central1-chazki-link.cloudfunctions.net/fnReintentFalabellaOrders";

const TIME_INTERVAL = process.env.TIME_INTERVAL || 10;

module.exports = { FUNCTION_URL, TIME_INTERVAL };
