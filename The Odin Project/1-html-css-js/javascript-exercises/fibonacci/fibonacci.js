const fibonacci = function (length) {
  const len = parseInt(length);
  if (len < 0) return "OOPS";
  let res = [];
  for (let i = 0; i < len; i++) {
    if (i === 0 || i === 1) res.push(1);
    else res.push(res[i - 1] + res[i - 2]);
  }

  return res[len - 1];
};

module.exports = fibonacci;
