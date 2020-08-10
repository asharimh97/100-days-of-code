require "../calculator"

describe Calculator do
  describe "#add" do
    it "returns the sum of two numbers" do
      calculator = Calculator.new
      expect(calculator.add(5, 2)).to eql(7)
    end

    it "returns the sum of more than two numbers" do 
      calculator = Calculator.new
      expect(calculator.add(2, 5, 7)).to eql(14)
    end
  end

  describe "#subtract" do
    it "returns subtract of two numbers" do 
      calculator = Calculator.new
      expect(calculator.subtract(20, 2)).to eql(18)
    end

    it "returns subtract of more than two numbers" do 
      calculator = Calculator.new
      expect(calculator.subtract(10, 4, 3)).to eql(3)
    end
  end

  describe "#multiply" do
    it "returns multiplied of two numbers" do 
      calculator = Calculator.new
      expect(calculator.multiply(20, 2)).to eql(40)
    end

    it "returns multiplied of more than two numbers" do 
      calculator = Calculator.new
      expect(calculator.multiply(2, 4, 3)).to eql(24)
    end
  end

  describe "#divide" do
    it "returns divide of two numbers" do 
      calculator = Calculator.new
      expect(calculator.divide(20, 2)).to eql(10)
    end

    it "returns divide of more than two numbers" do 
      calculator = Calculator.new
      expect(calculator.divide(10, 2, 5)).to eql(1)
    end
  end
end