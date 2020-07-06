const palindromes = function (word) {
  let newWord = "";
  for (let j = 0; j < word.length; j++) {
    if (/[a-z]/i.test(word[j])) {
      newWord += word[j].toLowerCase();
    }
  }

  const mid = Math.round(newWord.length / 2);
  const minus = newWord.length % 2 === 0 ? 0 : 1;
  const leftPart = newWord.slice(0, mid - minus);
  const rightPart = newWord.slice(mid).split("").reverse().join("");

  return leftPart === rightPart;
};

module.exports = palindromes;
