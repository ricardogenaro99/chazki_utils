const result = [];

const arrMenor = [
	"140001381326",
	"140001391259",
	"140001395669",
	"149079295696",
	"149079477885",
	"149079539707",
	"149079552755",
	"149080013405",
	"149080178338",
	"149080214308",
	"149080257409",
	"149080289196",
	"149080533174",
	"149080926009",
	"149081040700",
];

const arrMayor = [
	"149081040700",
	"140001395669",
	"149080178338",
	"149079539707",
	"140001391259",
	"149080214308",
	"149079552755",
	"149079477885",
	"149080257409",
	"149079295696",
	"149080289196",
	"149080013405",
	"149080926009",
	"149080533174",
	"140001381326",
	"149072713916",
	"149078753754",
	"149078276523",
	"14907393113402",
	"140001375897",
	"149076737804",
	"149077706600",
];

arrMayor.forEach((e) => {
	if (!arrMenor.includes(e)) {
		result.push(e);
	}
});

const getSize = (arr) => {
	return {
		arraySize: arr.length,
		debuggedSize: [...new Set(arr)].length,
	};
};

const response = {
	arrMenorSize: getSize(arrMenor),
	arrMayorSize: getSize(arrMayor),
	result,
	resultSize: getSize(result),
};

console.log(JSON.stringify(response, null, 2));
