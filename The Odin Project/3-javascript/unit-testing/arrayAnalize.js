const analyze = arr => {
  const newArr = arr.sort((a, b) => a - b);
  const average = arr.reduce((prev, curr) => prev + curr, 0);
  return {
    average: average / arr.length,
    min: newArr[0],
    max: newArr[arr.length - 1],
    length: arr.length
  };
};

module.exports = analyze;
