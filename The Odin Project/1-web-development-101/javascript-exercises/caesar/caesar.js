const caesar = function (word, iter) {
  let newWord = "";
  for (let i = 0; i < word.length; i++) {
    if (/[a-z]/i.test(word[i])) {
      const code = word.charCodeAt(i);
      const start = code >= 97 ? 97 : 65; // most begining of alphabet code
      const end = code <= 90 ? 90 : 122; // latest of alphabet code
      const iteration = (code - start + iter) % 26;

      // if iteration < 0, which means direction is to left, use
      // latest character as starting point
      const startChar = iteration >= 0 ? start : end + 1;
      newWord += String.fromCharCode(startChar + iteration);
    } else {
      newWord += word[i];
    }
  }

  return newWord;
};

module.exports = caesar;
