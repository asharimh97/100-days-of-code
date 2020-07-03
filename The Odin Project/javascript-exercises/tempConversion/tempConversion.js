const roundNumber = (number) => Math.round(number * 10) / 10;

const ftoc = function (temperature) {
  const ratio = 5 / 9;
  const celcius = (temperature - 32) * ratio;

  return roundNumber(celcius);
};

const ctof = function (temperature) {
  const ratio = 9 / 5;
  const farenheit = temperature * ratio + 32;

  return roundNumber(farenheit);
};

module.exports = {
  ftoc,
  ctof,
};
