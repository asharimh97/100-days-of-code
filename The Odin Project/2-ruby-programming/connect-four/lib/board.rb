class Board
  BOARD_ROW = 6
  BOARD_COLUMN = 7

  attr_accessor :board

  def initialize
    init_board
  end

  def init_board
    clear_board
  end

  def clear_board
    @board = Array.new(BOARD_ROW) { Array.new(BOARD_COLUMN, nil) }
  end

  def insert_piece (column)
  end

  def horizontal_win (player, row_index, column_index)
  end

  def vertical_win (player, row_index, column_index)
  end

  def diagonal_win (player, row_index, column_index)
  end

  def four_in_a_row? (arr)
  end
end