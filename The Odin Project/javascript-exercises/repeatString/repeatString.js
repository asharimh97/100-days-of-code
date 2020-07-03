const repeatString = function (word, iteration) {
  let repeatedWord = "";
  if (iteration < 0) {
    return "ERROR";
  } else {
    for (let i = 0; i < iteration; i++) {
      repeatedWord += word;
    }

    return repeatedWord;
  }
};

module.exports = repeatString;
