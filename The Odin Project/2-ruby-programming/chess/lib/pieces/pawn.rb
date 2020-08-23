class Pawn
  attr_accessor :color
  def initialize (color)
    @color = color
    @direction = color == "black" ? -1 : 1
  end

  def possible_moves (position)
    moves = []
    x, y = position

    moves << [x, y + @direction] if (y + @direction).between?(0, 7)

    moves << [x, y + (@direction * 2)] if (@color == "black" && y == 6) || (@color == "white" && y == 1)
    
    # pawn also has an attacking moves 1 square diagonally (left/right)
    # but I think it's not possible to generate from this method, and it's better
    # to generate the pawn's attacking moves in the game class

    moves
  end

  def to_s
    @color == "black" ? "\u{265F}" : "\u{2659}"
  end

  def inspect
    to_s
  end
end

# pawn = Pawn.new("black")
# pawn2 = Pawn.new("white")

# p pawn.possible_moves([0, 6])
# p pawn2.possible_moves([0, 7])