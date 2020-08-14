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

  def horizontal_presence (row_index)
    board[row_index]
  end

  def vertical_presence (column_index)
    array = []
    board.each do |row|
      array.push(row[column_index])
    end

    array
  end

  def diagonal_presence (row_index, column_index)
  end

  def four_in_a_row? (piece, arr)
    count = 0
    arr.each do |disc|
      break if count >= 4

      if (disc == piece)
        count += 1
      else
        count = 0
      end
    end

    count >= 4
  end
end