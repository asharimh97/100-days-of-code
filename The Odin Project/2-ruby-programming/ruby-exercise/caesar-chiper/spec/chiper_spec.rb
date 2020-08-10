require "../chiper"

describe "test caesar chiper" do
  it "works with single letter" do
    expect(caesar_chiper("A", 1)).to eql("B")
  end

  it "works with phrases" do
    expect(caesar_chiper("Hello, World!", 5)).to eql("Mjqqt, Btwqi!")
  end

  it "works with negative shift" do
    expect(caesar_chiper("Mjqqt, Btwqi!", -5)).to eql("Hello, World!")
  end

  it "wraps" do
    expect(caesar_chiper("Z", 1)).to eql("A")
  end
end