// operational function

function add(a, b) {
  return a + b;
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

function operate(a, b, operator) {
  console.log({ a, b, operator });
  const operators = {
    x: multiply,
    "*": multiply,
    "/": divide,
    "+": add,
    "-": subtract,
  };

  return operators[operator](a, b);
}

function cleanOperator(sequenceNumber, operand1, operand2) {
  let numbers = [...sequenceNumber];
  let dirty = true;

  while (dirty) {
    let idx;
    const op1 = numbers.indexOf(operand1);
    const op2 = numbers.indexOf(operand2);

    idx = op1 > 0 && op2 > 0 ? Math.min(op1, op2) : op1 > 0 ? op1 : op2;

    if (idx < 0) {
      dirty = false;
      break;
    }
    const operator = numbers[idx];
    const num1 = parseFloat(numbers[idx - 1]);
    const num2 = parseFloat(numbers[idx + 1]);
    const newNumber = operate(num1, num2, operator);
    numbers.splice(idx - 1, 3, newNumber);
  }

  return numbers;
}

function calculate() {
  let numbers = "3 / 17 * 2 + 17";
  numbers = numbers.split(" ");

  numbers = cleanOperator(numbers, "*", "/");
  numbers = cleanOperator(numbers, "+", "-");

  console.log(numbers);
}
