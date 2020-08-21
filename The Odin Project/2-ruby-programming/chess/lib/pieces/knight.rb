require_relative "movements"

class Knight
  attr_accessor :color
  def initialize(color)
    @color = color
  end

  def possible_moves (position)
    moves = []
    x, y = position

    Movements::KNIGHT_MOVES.each do |move|
      i, j = move
      x1 = x + i
      y1 = y + i

      moves.push([x1, y1]) if x1.between?(0, 7) && y1.between?(0,7)
    end

    moves
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

knight = Knight.new("black")

p knight.possible_moves([0,1])