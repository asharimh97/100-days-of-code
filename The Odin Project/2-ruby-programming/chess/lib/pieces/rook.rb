require_relative "./movements"

class Rook 
  attr_accessor :color
  def initialize (color)
    @color = color
  end

  def possible_moves (position)
    moves = []
    x, y = position

    Movements::ROOK_MOVES().each do |move|
      i, j = move
      x1 = x + i
      y1 = y + j

      moves.push([x1, y1]) if x1.between?(0, 7) && y1.between?(0, 7)
    end

    moves
  end

  def to_s
    @color == "black" ? "\u{265C}" : "\u{2656}"
  end

  def inspect
    to_s
  end
end

# rook = Rook.new("black")

# p rook.possible_moves([0, 0])