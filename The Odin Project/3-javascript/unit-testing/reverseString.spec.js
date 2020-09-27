const reverseString = require("./reverseString");

describe("test reverse string", () => {
  it("return reversed string of word", () => {
    expect(reverseString("abc")).toBe("cba");
  });
  it("returns reversed string alongside with capitalized letter", () => {
    expect(reverseString("Lorem")).toBe("meroL");
  });
  it("returns reversed string with space and capitalized letter", () => {
    expect(reverseString("Lorem Ipsum")).toBe("muspI meroL");
  });
});
