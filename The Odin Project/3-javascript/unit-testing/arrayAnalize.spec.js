const analyze = require("./arrayAnalize");

describe("test array analysis", () => {
  it("returns result of analyzed array", () => {
    const arr = [1, 8, 3, 4, 2, 6];
    const res = {
      average: 4,
      min: 1,
      max: 8,
      length: 6
    };
    expect(analyze(arr)).toEqual(res);
  });
  it("returns result of analyzed array", () => {
    const arr = [1, 1, 1, 1, 1];
    const res = {
      average: 1,
      min: 1,
      max: 1,
      length: 5
    };
    expect(analyze(arr)).toEqual(res);
  });
});
