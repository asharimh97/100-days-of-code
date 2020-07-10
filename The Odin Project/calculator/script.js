// variables to operate calculation
let sequence = "";
let currentNumber = "";
let currentOperator = "";

// element selector
const buttons = document.querySelectorAll(".button-pad");
const display = document.querySelector(".calculator__display");
const operator = document.querySelector(".calculator__operator");

buttons.forEach((button) => {
  button.addEventListener("click", function () {
    const { type } = this.dataset;
    if (type === "number") {
      clickNumberPad(this);
    } else if (type === "operator") {
      clickOperatorPad(this);
    }
  });
});

function clickNumberPad(element) {
  /**
   * TODOS:
   * if (currentNumber && currentOperator)
   *    push number and operator to sequence
   *    clean currentNumber
   *
   * push value to current number
   * display number
   */

  if (currentOperator) {
    sequence += ` ${currentOperator} `;
    currentOperator = "";
    display.textContent = "";
  }

  currentNumber += element.value;
  display.textContent = currentNumber;
}

function clickOperatorPad(element) {
  if (currentNumber) {
    sequence += currentNumber;
    currentNumber = "";
  }

  if (element.value === "=") {
    // calculate sequence and push res to sequence
    // clear operator and set current number and text content
    console.log(sequence);
    const [res] = calculate(sequence);

    sequence = res;
    currentNumber = "";
    currentOperator = "";

    operator.textContent = "";
    display.textContent = res;
    return;
  }
  currentOperator = element.value;
  operator.textContent = currentOperator;
}

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

function calculate(sequence) {
  let numbers = sequence;
  numbers = numbers.split(" ");

  numbers = cleanOperator(numbers, "*", "/");
  numbers = cleanOperator(numbers, "+", "-");

  return numbers;
}
