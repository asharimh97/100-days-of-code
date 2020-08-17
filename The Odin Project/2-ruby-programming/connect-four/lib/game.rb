require_relative "./board"
require_relative "./player"

class Game
  attr_accessor :player1, :player2, :board, :current_player
  def initialize
    @board = nil
    @player1 = nil
    @player2 = nil
    @current_player = nil
    @game_over = false
  end

  def start_game
    create_player("1")
    create_player("2")
    @board = Board.new

    @current_player = @player1
    play_game
  end

  def play_game
    @board.to_s

    until @game_over || @board.board_full? do
      puts
      player_turn
      @board.to_s
      switch_player unless @game_over
    end

    @game_over ? announce_winner : announce_tie
  end

  def create_player(id)
    print "Insert your name: "
    name = gets.chomp

    print "Insert your disc piece (1 char): "
    piece = gets.chomp

    player = Player.new(name, piece)
    if id == "1"
      @player1 = player
    else
      @player2 = player
    end

    puts "Welcome, #{player.name}! You are player ##{id}!"
  end

  def player_turn
    puts "#{@current_player.name}'s turn."
    print "Choose column to place your disc (1-7): "
    column = gets.chomp.to_i

    unless column.between?(1,7) 
      puts "Insert valid column!"
      return player_turn 
    end

    insert = @board.insert_piece(@current_player, column - 1)

    unless insert.nil?
      piece, row, col = insert
      @game_over = @board.has_winner?(piece, row, col)
    else
      puts "Oops column is full!"
      player_turn
    end
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def greet_player
    puts "Welcome to Connect Four Game"
    puts "\n"
    puts "Would you play?"
    puts "[Y] Yes"
    puts "[N] No"
  end

  def exit_greeting
    puts
    puts "Bye bye!"
  end

  def announce_winner
    puts
    puts "Game over! It's #{@current_player.name} win!"
  end

  def announce_tie
    puts
    puts "Good game! Tie!"
  end
end