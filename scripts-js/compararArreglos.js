const result = [];

const arr1 = [];

const arr2 = [];

arr2.forEach((e) => {
	if (!arr1.includes(e)) {
		result(e);
	}
});

const getSize = (arr) => {
	return {
		arraySize: arr.length,
		debuggedSize: [...new Set(arr)].length,
	};
};

const response = {
	arr1Size: getSize(arr1),
	arr2Size: getSize(arr2),
	result,
};

console.log(JSON.stringify(response, null, 2));
