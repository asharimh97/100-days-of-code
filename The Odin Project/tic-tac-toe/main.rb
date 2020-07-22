class TicTacToe 

  def initialize(first_player, second_player)
    @first_player = first_player
    @second_player = second_player

    @step_left = 9
    @game_over = false
    @game_winner = nil

    @board = Array.new(9)

    puts "Welcome to TicTacToe battle in Ruby."
    puts "Player 1: #{first_player}. \t\t Player 2: #{second_player}"

    attempt until @game_winner || @game_over
  end

  def announce_winner
    if (@game_over)
      puts "The winner is #{@game_winner}"
    elsif (@step_left == 0)
      puts "Tie, habis langkah"
      @game_over = true
    end
  end

  def attempt
    
    mark = @step_left.even? ? "o" : "x"
    current_player = @step_left.odd? ? @first_player : @second_player
    puts "\n#{current_player}'s turn': "
    index = gets.chomp.to_i
    puts "#{current_player} chose #{index}"
    
    return puts error_boundary if index > 9 || index < 1
    return puts error_index unless @board[index-1] == nil

    @board[index-1] = mark
    @step_left -= 1

    announce_winner if winner_decided?
  end

  private
  def error_boundary
    "Out of boundary"
  end

  def error_index
    "The coordinate already occupied"
  end

  def winner_decided?
    if @step_left <= 4
      winner_coordinate = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [7, 5, 3]];
      
      # do checking
      # update winner, and set game over
      winner_coordinate.each do |c|
        if c.all? { |x| @board[x-1] == "x"}
          @game_over = true
          @game_winner = @first_player
          break
        elsif c.all? { |x| @board[x-1] == "o"}
          @game_over = true
          @game_winner = @second_player
          break
        end
      end

      return true
    end

    return false
  end

end

my_game = TicTacToe.new("John", "Pantau")