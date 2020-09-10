// DOM Elements
const form = document.querySelector("#player-info");
const board = document.querySelector(".game-board");
const cells = document.querySelectorAll(".board-cell");
const winnerAnnounce = document.querySelector("#winner-announcement");

// GAME VARIABLES
let game = new Array(9).fill("");
let player1 = "Player 1";
let player2 = "Player 2";
let currentPlayer = player1;

let gameOver = false;
let winner = null;

// FUNCTIONS

function cellClick() {
  const { index } = this.dataset;
  const char = currentPlayer == player1 ? "x" : "o";
  const componentClass = currentPlayer == player1 ? "cross" : "circle";

  if (game[index] == "") {
    game[index] = char;
    this.classList.add(componentClass);

    checkWinner();
    changePlayer();
  } else {
    alert("Column has been occuppied");
  }
}

cells.forEach(cell => cell.addEventListener("click", cellClick));

form.addEventListener("submit", function (e) {
  e.preventDefault();
  const { player_1, player_2 } = this;
  player1 = player_1.value;
  player2 = player_2.value;

  const formWrapper = document.querySelector("#player-form");
  const gameBoardWrapper = document.querySelector("#board-wrapper");

  formWrapper.classList.add("hide");
  gameBoardWrapper.classList.remove("hide");
});

function changePlayer() {
  currentPlayer = currentPlayer == player1 ? player2 : player1;
}

function checkWinner() {
  const winner_coordinate = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [7, 5, 3]
  ];

  if (game.some(c => c == "")) {
    winner_coordinate.forEach(coordinate => {
      if (coordinate.every(cell => game[cell - 1] == "x")) {
        // x win, game over
        gameOver = true;
        winner = player1;
        endGame();
      } else if (coordinate.every(cell => game[cell - 1] == "o")) {
        // o win, game over
        gameOver = true;
        winner = player2;
        endGame();
      }
    });
  } else {
    gameOver = true;
    alert("No winner!");
    endGame();
  }
}

function endGame() {
  // remove cell listener
  cells.forEach(cell => {
    cell.removeEventListener("click", cellClick);
  });

  // set board background
  board.style.background = "#f0f0f0";

  if (winner) {
    winnerAnnounce.textContent = `It's a win of ${winner}!`;
  } else {
    winnerAnnounce.textContent = `Uh Oh! Game draw`;
  }
}
