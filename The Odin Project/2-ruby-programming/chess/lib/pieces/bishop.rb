require_relative "./movements"

class Bishop
  include Movements

  attr_accessor :color
  def initialize(color)
    @color = color
  end

  def possible_moves (position)
    moves = []
    x, y = position

    BISHOP_MOVES.each do |direction|
      direction_moves = []

      direction.each do |move|
        i, j = move
        x1 = x + i
        y1 = y + j

        direction_moves.push([x1, y1]) if x1.between?(0, 7) && y1.between?(0, 7)
      end

      moves.push(direction_moves) if direction_moves.length > 0
    end

    moves
  end

  def to_s
    @color == "black" ? "\u{265D}" : "\u{2657}"
  end

  def inspect
    to_s
  end
end

bishop = Bishop.new("white")

p bishop.possible_moves([7, 2])