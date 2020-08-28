require_relative "./movements"

class Queen
  include Movements

  attr_accessor :color
  def initialize (color)
    @color = color
  end

  def possible_moves (position)
    queen_moves = [].concat(ROOK_MOVES, BISHOP_MOVES)
    moves = []
    x, y = position

    queen_moves.each do |direction|
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
    @color == "black" ? "\u{265B}" : "\u{2655}"
  end

  def inspect
    to_s
  end
end

# queen = Queen.new("black")

# p queen.possible_moves([0, 4])