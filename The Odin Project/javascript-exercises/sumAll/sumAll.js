const sumAll = function () {
  const numbers = [...arguments];
  const validNumbers = numbers.every(
    (num) => num > 0 && typeof num === "number"
  );

  if (!validNumbers) {
    return "ERROR";
  } else {
    let result = 0;
    let min = Math.min(numbers[0], numbers[1]);
    let max = Math.max(numbers[0], numbers[1]);

    for (let i = min; i <= max; i++) {
      result += i;
    }

    return result;
  }
};

module.exports = sumAll;
