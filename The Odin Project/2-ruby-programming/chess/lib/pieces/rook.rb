class Rook 
  attr_accessor :color
  def initialize (color)
    @color = color
  end

  def to_s
    @color == "black" ? "\u{265C}" : "\u{2656}"
  end

  def inspect
    to_s
  end
end