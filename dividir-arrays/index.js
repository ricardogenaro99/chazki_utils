const fs = require("fs");
const DATA = require("./data.json");

const partition = (n) => {
	const quantity = Math.round(DATA.length / n);

	for (let i = 0; i < n; i++) {
		const [desde, hasta] = [
			quantity * i,
			quantity * (i + 1 == n ? DATA.length : i + 1),
		];

		const part = DATA.slice(desde, hasta);
		console.log(part);

		fs.writeFileSync(`./partitions/part-${desde}-${hasta}.json`, JSON.stringify(part,null,4));
	}
};

partition(17);
