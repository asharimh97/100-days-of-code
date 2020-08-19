class Pawn
  attr_accessor :color
  def initialize (color)
    @color = color
  end

  def to_s
    @color == "black" ? "\u{265F}" : "\u{2659}"
  end

  def inspect
    to_s
  end
end