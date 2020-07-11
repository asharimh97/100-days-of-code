// variables to operate calculation
let sequence = "";
let currentNumber = "";
let currentOperator = "";

// element selector
const buttons = document.querySelectorAll(".button-pad");
const display = document.querySelector(".calculator__display");
const operator = document.querySelector(".calculator__operator");
const btnDelete = document.querySelector(".calculator__delete");

buttons.forEach((button) => {
  button.addEventListener("click", function () {
    const { type } = this.dataset;
    if (type === "number") {
      clickNumberPad(this.value);
    } else if (type === "operator") {
      clickOperatorPad(this.value);
    }
  });
});

window.addEventListener("keydown", (e) => {
  const { key } = e;
  if (/\d/.test(key)) {
    clickNumberPad(key);
  } else if (/[+\-\*\/=x]/.test(key)) {
    clickOperatorPad(key);
  } else if (key == "Backspace") {
    deleteNumber();
  } else if (key == "Enter") {
    clickOperatorPad("=");
  }
});

btnDelete.addEventListener("click", deleteNumber);

function clickNumberPad(value) {
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

  currentNumber += value;
  display.textContent = currentNumber;
}

function clickOperatorPad(value) {
  if (!currentNumber && sequence.split(" ").length === 1) {
    currentOperator = value;
  } else if (currentNumber) {
    sequence += currentNumber;
    currentNumber = "";
    currentOperator = value;
  }

  if (value === "=") {
    // calculate sequence and push res to sequence
    // clear operator and set current number and text content
    // console.log(sequence);
    const [res] = calculate(sequence);

    sequence = res.toString();
    currentNumber = "";
    currentOperator = "";

    operator.textContent = "";
    display.textContent = res;
    operator.textContent = "=";
    return;
  }

  operator.textContent = currentOperator;
}

function deleteNumber() {
  let number = currentNumber.slice(0, currentNumber.length - 1);
  currentNumber = number;

  if (
    sequence &&
    sequence.split(" ").length === 1 &&
    !currentNumber &&
    !currentOperator
  ) {
    number = "";
    sequence = "";
    operator.textContent = "";
  }

  const currentSequence = sequence.trim();

  if (number === "" && /[+\-\*\/]/.test(currentSequence.slice(-1))) {
    sequence = sequence.slice(0, sequence.length - 3);
  }

  display.textContent = number;
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
