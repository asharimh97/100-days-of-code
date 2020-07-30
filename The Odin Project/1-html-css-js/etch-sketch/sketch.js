const gridWrapper = document.getElementById("grid-wrapper");
const errorMessage = document.getElementById("error-message");

function drawGrid(dimension = 16) {
  // set max dimension is 64x64
  const size = dimension > 64 ? 64 : dimension < 16 ? 16 : dimension;

  if (dimension < 16 || dimension > 64) {
    errorMessage.textContent =
      "Dimension size has been adjusted to between 16 - 64";
  } else {
    errorMessage.textContent = "";
  }

  gridWrapper.style.gridTemplateColumns = `repeat(${size}, 1fr)`;
  for (let i = 0; i < size; i++) {
    for (let j = 0; j < size; j++) {
      createGridItem(gridWrapper);
    }
  }
}

function createGridItem(parent) {
  const div = document.createElement("div");
  div.style.border = "dashed 0.5px #ccc";
  div.addEventListener("mouseenter", function () {
    this.style.background = randomizeBackground();
  });

  parent.appendChild(div);
}

function randomizeBackground() {
  const hue = Math.round(Math.random() * 360);
  const saturation = "100%";
  const luminosity = "50%";

  return `hsl(${hue}, ${saturation}, ${luminosity})`;
}

function cleanCanvas() {
  const items = gridWrapper.querySelectorAll("div");

  items.forEach((item) => {
    item.style.background = "none";
  });
}

function removePixels() {
  const items = gridWrapper.querySelectorAll("div");
  items.forEach((item) => {
    item.remove();
  });
}

function drawFromInput() {
  let dimension = prompt();
  removePixels();
  drawGrid(dimension);
}

drawGrid();
