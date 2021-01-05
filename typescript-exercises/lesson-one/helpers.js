// @ts-check

/**
 * Convert Hexacode to RGB
 * @param {string} color 
 * 
 * @return {string} - MappedHexCode
 */
function convertHexToRgb(color) {
  const hexCode = color.substr(1).match(/\w{1,2}/g);
  const mappedHexCode = hexCode.map(code => parseInt(code, 16));

  return `rgb(${mappedHexCode.join(", ")})`;
}

/**
 * @typedef {Object} BandarDetector
 * @property {number} val
 * @property {number} volume
 * @property {string} accdist
 */

/**
  * Get bandar detector data
  * @param {BandarDetector[]} data - Array of bandar detector
  */
function getBandarDetector(data) {
  return data.map(item => ({
    val: item.val,
    status: item.accdist,
    vol: item.volume
  }))
}

/** @type BandarDetector */
const detector = {
  val: 123123,
  volume: 120,
  accdist: 'lorem ipsum'
};

const color = convertHexToRgb("#CDFA03");
console.log(color);