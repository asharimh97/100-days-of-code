class Bishop
  attr_accessor :color
  def initialize(color)
    @color = color
  end

  def to_s
    @color == "black" ? "\u{265D}" : "\u{2657}"
  end

  def inspect
    to_s
  end
end

bishop = Bishop.new("white")

puts bishop.color