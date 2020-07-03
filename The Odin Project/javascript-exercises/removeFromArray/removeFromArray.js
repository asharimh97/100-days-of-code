const removeFromArray = function (...args) {
  let [array, ...removedValues] = args;
  removedValues.forEach((val) => {
    const idx = array.indexOf(val);
    if (idx >= 0) array.splice(idx, 1);
  });

  return array;
};

module.exports = removeFromArray;
