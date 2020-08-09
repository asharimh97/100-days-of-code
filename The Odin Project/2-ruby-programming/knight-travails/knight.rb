class Knight
  attr_accessor :position, :moves, :parent
  def initialize (position, parent = nil)
    @position = position
    @parent = parent
    @moves = possible_moves(position)
  end

  # all possible moves from initial position
  # example: if knight in [0,0], the possible moves will be [1, 2], [2, 1]
  def possible_moves (position)
    moves = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, 2], [-2, 1], [-2, -1], [-1, -2]]

    # destrucure array
    x, y = position

    possible_moves = []
    moves.each do |move|
      i, j = move
      x1 = x + i
      y1 = y + j
      possible_moves.push([x1, y1]) if x1.between?(0, 7) && y1.between?(0, 7)
    end

    possible_moves
  end
end