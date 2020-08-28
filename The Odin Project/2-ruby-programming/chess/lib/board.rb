Dir[File.join(__dir__, "pieces", "*.rb")].each {|file| require_relative file }

class Board
  attr_accessor :board
  def initialize
    @board = nil

    init_board
    set_piece
  end

  def init_board
    @board = Array.new(8) { Array.new(8, nil) }
  end

  def set_piece
    set_black_piece
    set_white_piece
  end

  def set_black_piece
    @board[7][0] = Rook.new("black")
    @board[7][7] = Rook.new("black")
    
    @board[7][1] = Knight.new("black")
    @board[7][6] = Knight.new("black")

    @board[7][2] = Bishop.new("black")
    @board[7][5] = Bishop.new("black")

    @board[7][3] = King.new("black")
    @board[7][4] = Queen.new("black")

    @board[6].each_with_index {|column, i| @board[6][i] = Pawn.new("black")}
  end

  def set_white_piece
    @board[0][0] = Rook.new("white")
    @board[0][7] = Rook.new("white")

    @board[0][1] = Knight.new("white")
    @board[0][6] = Knight.new("white")

    @board[0][2] = Bishop.new("white")
    @board[0][5] = Bishop.new("white")

    @board[0][3] = King.new("white")
    @board[0][4] = Queen.new("white")

    @board[1].each_with_index { |column, i| @board[1][i] = Pawn.new("white") }
  end

  def to_s
    puts "   " + Array.new(8, "----").join("") + "-"
    for i in 7.downto(0)
      row = @board[i]
      row_content = "#{i+1}  "
      row.each_with_index do |column, j|
        row_content +=  "| #{column.nil? ? " " : column} "
      end
      row_content += "|"
      puts row_content
      puts "   " + Array.new(8, "----").join("") + "-"
    end
    puts "     A   B   C   D   E   F   G   H"
  end
end

# board = Board.new

# board.to_s

# piece = board.board[1][0]

# yang dipake ketika possible moves [column, row] => [column, row]
# untuk akses koordinat di board [row][column]
# p piece.possible_moves([0, 1])
# p piece.attack_moves if piece.kind_of? Pawn