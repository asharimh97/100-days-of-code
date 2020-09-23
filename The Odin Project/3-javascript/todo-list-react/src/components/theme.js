const colors = {
  white: "#fff",
  shadedWhite: "#fafafa",
  black: "#333",
  softerBlack: "#8e8e93",
  blue: "#007aff",
  red: "#ff3b30",
  purple: "#af52de",
  yellow: "#ffcc00",
  orange: "#ff9500",
  green: "#34c759",
  teal: "#5ac8fa",
  indigo: "#5856d6",
  grey: "#d1d1d6",
  darkerGrey: "#c7c7cc",
  softerGrey: "#e5e5ea"
};

const fontSizes = [12, 14, 16, 20, 24, 32, 48];
fontSizes.midSmall = 18;
fontSizes.mid = 28;
fontSizes.midBig = 40;

const shadows = [
  `0 1px 1px 0 rgba(10, 31, 68, 0.08), 0 0 1px 0 rgba(10, 31, 68, 0.08)`,
  `0 3px 4px 0 rgba(10, 31, 68, 0.1), 0 0 1px 0 rgba(10, 31, 68, 0.08)`,
  `0 8px 10px 0 rgba(10, 31, 68, 0.1), 0 0 1px 0 rgba(10, 31, 68, 0.08)`,
  `0 18px 18px 0 rgba(10, 31, 68, 0.12), 0 0 1px 0 rgba(10, 31, 68, 0.1)`,
  `0 26px 26px 0 rgba(10, 31, 68, 0.12), 0 0 1px 0 rgba(10, 31, 68, 0.1)`,
  `0 3px 32px 0 rgba(10, 31, 68, 0.1), 0 0 1px 0 rgba(10, 31, 68, 0.08)`
];

export default { colors, shadows, fontSizes };
