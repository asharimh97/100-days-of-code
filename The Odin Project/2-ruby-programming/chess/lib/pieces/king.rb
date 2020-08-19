class King
  attr_accessor :color
  def initialize (color)
    @color = color
  end

  def to_s
    @color == "black" ? "\u{265A}" : "\u{2654}"
  end

  def inspect
    to_s
  end
end