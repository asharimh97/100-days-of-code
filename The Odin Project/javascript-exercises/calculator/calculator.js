function add(a, b) {
  return a + b;
}

function subtract(a, b) {
  return a - b;
}

function sum(numbers) {
  const total = numbers.reduce(
    (currentValue, number) => currentValue + number,
    0
  );

  return total;
}

function multiply(numbers) {
  const total = numbers.reduce(
    (currentValue, number) => currentValue * number,
    1
  );

  return total;
}

function power(number, power) {
  return Math.pow(number, power);
}

function factorial(number) {
  let res = 1;

  if (number > 0) {
    for (let i = number; i >= 1; i--) {
      res *= i;
    }
  }

  return res;
}

module.exports = {
  add,
  subtract,
  sum,
  multiply,
  power,
  factorial,
};
