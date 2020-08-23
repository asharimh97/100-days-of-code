require_relative "./movements"

class King
  attr_accessor :color
  def initialize (color)
    @color = color
  end

  def possible_moves (position)
    moves = []
    x, y = position

    Movements::KING_MOVES.each do |move|
      i, j = move
      x1 = x + i
      y1 = y + j

      moves.push([x1, y1]) if x1.between?(0, 7) && y1.between?(0, 7)
    end

    moves
  end

  def to_s
    @color == "black" ? "\u{265A}" : "\u{2654}"
  end

  def inspect
    to_s
  end
end

# king = King.new("black")

# p king.possible_moves([3, 0])