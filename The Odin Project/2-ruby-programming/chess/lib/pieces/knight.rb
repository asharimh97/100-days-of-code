class Knight
  attr_accessor :color
  def initialize(@color)
    @color = color
  end

  def to_s
    if @color == "black"
      "\u{265E}"
    else
      "\u{2658}"
    end
  end

  def inspect
    to_s
  end
end