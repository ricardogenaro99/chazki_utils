const result = [];

const arrMenor = [];

const arrMayor = [];

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
