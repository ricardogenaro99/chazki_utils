const bigQuery = require("./big-query.json");
const dbData = require("./db.json");

const bigQueryClear = []

const bigQueryTmp = bigQuery.map(({ TrackCode, InfoRequest }) => {
  const req = JSON.parse(InfoRequest)
	return {
		trackCode: TrackCode,
    staus_code: req.status.code,
    staus_date: req.status.date

	};
});

bigQueryTmp.forEach( e=> {
  const find = bigQueryClear.find( f => f.trackCode === e.trackCode )
})



console.log(bigQueryClear)