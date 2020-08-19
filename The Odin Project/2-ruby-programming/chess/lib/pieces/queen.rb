class Queen
  attr_accessor :color
  def initialize (color)
    @color = color
  end

  def to_s
    @color == "black" ? "\u{265B}" : "\u{2655}"
  end

  def inspect
    to_s
  end
end