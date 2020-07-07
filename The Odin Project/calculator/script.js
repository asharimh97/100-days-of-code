// operational function

function add([...args]) {
  return args.reduce((curr, obj) => curr + obj, 0);
}

function subtract(a, b) {
  return a - b;
}

function multiply(a, b) {
  return a * b;
}

function divide(a, b) {
  return a / b;
}

function operate() {
  const number = [...arguments];
  return function (operation) {
    return operation(number);
  };
}
