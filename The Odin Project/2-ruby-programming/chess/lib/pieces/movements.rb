module Movements
  KNIGHT_MOVES = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, 2], [-2, 1], [-2, -1], [-1, -2]]
  
  def Movements.ROOK_MOVES
    rook = []
    for i in 1..7
      rook.unshift([0, -i])
      rook.push([i, 0])
      rook.push([0, i])
      rook.unshift([-i, 0])
    end

    rook.sort
  end

  def Movements.BISHOP_MOVES
    bishop = []
    for i in 1..7
      bishop.unshift([-i, -i])
      bishop.unshift([-i, i])
      bishop.push([i, i])
      bishop.unshift([i, -i])
    end

    bishop.sort
  end
end

# p Movements::KNIGHT_MOVES
# # p Movements::ROOK_MOVES()
# p Movements::BISHOP_MOVES()