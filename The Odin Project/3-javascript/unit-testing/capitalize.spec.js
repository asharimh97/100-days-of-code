const capitalize = require("./capitalize");

describe("test capitalize word", () => {
  it("return capitalized word of lowercased word", () => {
    expect(capitalize("lorem ipsum")).toBe("Lorem ipsum");
  });
  it("return same result of word if already capitalized", () => {
    expect(capitalize("Lorem IpsuM")).toBe("Lorem IpsuM");
  });
  it("returns same result of uppercased word", () => {
    expect(capitalize("LOREM IPSUM")).toBe("LOREM IPSUM");
  });
});
