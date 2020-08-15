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

  def insert_piece (player, column)
    lowest_level = 0
    return nil unless @board[BOARD_ROW - 1][column].nil?

    while lowest_level < BOARD_ROW do
      if (@board[lowest_level][column].nil?) 
        break
      end
      lowest_level += 1
    end

    @board[lowest_level][column] = player.piece
  end

  def has_winner? (piece, level, column)
    horizontal = horizontal_presence(level)
    vertical = vertical_presence(column)
    left, right = diagonal_presence(level, column)

    four_in_a_row?(piece, horizontal) || four_in_a_row?(piece, vertical) || four_in_a_row?(piece, left) || four_in_a_row?(piece, right)
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
    left = diagonal_down_presence(row_index, column_index)
    right = diagonal_up_presence(row_index, column_index)

    [left, right]
  end

  def diagonal_down_presence (row_index, column_index)
    init_piece = board[row_index][column_index]
    arr = [init_piece]
    for i in 1..5
      arr.unshift(@board[row_index - i][column_index + i]) if (row_index - i).between?(0,5) && (column_index + i).between?(0,6)
      arr.push(@board[row_index + i][column_index - i]) if (row_index + i).between?(0,5) && (column_index - i).between?(0,6)
    end

    arr
  end

  def diagonal_up_presence (row_index, column_index)
    init_piece = board[row_index][column_index]
    arr = [init_piece]
    for i in 1..5
      arr.unshift(@board[row_index - i][column_index - i]) if (row_index - i).between?(0,5) && (column_index - i).between?(0,6)
      arr.push(@board[row_index + i][column_index + i]) if (row_index + i).between?(0,5) && (column_index + i).between?(0,6)
    end

    arr
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

  def to_s
    puts "    ---------------------------"
    for i in (BOARD_ROW-1).downto(0)
      row_content = "#{i + 1}  "
      for j in 0..BOARD_COLUMN-1
        d = @board[i][j]
        column_content = "|   "
        
        column_content = "| #{d} " unless d.nil?
        row_content += column_content
      end
      row_content += "|"
      puts row_content
      puts "   ----+---+---+---+---+---+----" if i > 0
    end
    puts "    ---------------------------"
    puts "     1   2   3   4   5   6   7"
  end
end