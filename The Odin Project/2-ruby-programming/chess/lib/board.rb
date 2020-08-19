class Board
  attr_accessor :board
  def initialize
    @board = nil
  end

  def init_board
    @board = Array.new(8) { Array.new(8, nil) }
  end

  def set_piece
    
  end

  def to_s
  end
end