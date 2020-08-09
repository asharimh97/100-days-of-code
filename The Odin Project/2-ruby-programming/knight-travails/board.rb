require_relative "knight"

class Board
  attr_accessor :board
  def initialize
    init_board
  end

  def init_board
    board = Array.new(8) { Array.new(8, 0) }
    @board = board
  end

  def print_board (steps = [])
    print_steps(steps)
    
    puts "\n"
    puts "    -----------------------------------------------"
    @board.each_with_index do |row, idx|
      row_content = "#{idx + 1}  "
      row.each_with_index do |column, idz|
        row_col = [idx, idz]
        column_content = "|     "
        if steps[0] == row_col
          column_content = "|  \u{265E}  "
        elsif steps[-1] == row_col
          column_content = "|  \u{2658}  "
        elsif steps.include? (row_col)
          column_content = "|  x  "
        end
        
        row_content += column_content
      end
      row_content += "|"
      puts row_content
      puts "    -----+-----+-----+-----+-----+-----+-----+-----" if idx < board.length - 1
    end

    puts "    -----------------------------------------------"
    puts "      A     B     C     D     E     F     G     H"
    puts
  end

  def print_steps (steps = [])
    puts "You made it in #{steps.length - 1} moves! Here is your path: "
    steps.each { |step| p step }
  end
end