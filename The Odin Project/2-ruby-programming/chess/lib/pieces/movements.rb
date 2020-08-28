module Movements
  KNIGHT_MOVES = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, 2], [-2, 1], [-2, -1], [-1, -2]]
  KING_MOVES = [[-1, 0], [-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1]]

  # Directional moves
  VERTICAL_UP = [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]]
  VERTICAL_DOWN = [[0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7]]

  HORIZONTAL_LEFT = [[-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]]
  HORIZONTAL_RIGHT = [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]]

  # Diagonal moves
  # top left to bottom left '\'
  DIAGONAL_TOP_LEFT = [[-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7]]
  DIAGONAL_BOTTOM_RIGHT = [[1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7]]
  
  # bottom left to top right '/'
  DIAGONAL_BOTTOM_LEFT = [[-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7]]
  DIAGONAL_TOP_RIGHT = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7]]
  
  ROOK_MOVES = [HORIZONTAL_LEFT, VERTICAL_UP, HORIZONTAL_RIGHT, VERTICAL_DOWN]
  BISHOP_MOVES = [DIAGONAL_TOP_LEFT, DIAGONAL_TOP_RIGHT, DIAGONAL_BOTTOM_RIGHT, DIAGONAL_BOTTOM_LEFT]
end

# p Movements::KNIGHT_MOVES
# # p Movements::ROOK_MOVES()
# p Movements::BISHOP_MOVES()