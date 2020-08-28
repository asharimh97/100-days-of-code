require_relative "./board"
require_relative "./player"
Dir[File.join(__dir__, "pieces", "*.rb")].each {|file| require_relative file }

class Game
  attr_accessor :board, :player, :white, :black

  def initialize
    @board = Board.new
    @white = nil
    @black = nil
    @player = nil
  end

  def start_game
    instruction

    puts "You start a new game"
    input_player("white")
    input_player("black")

    # init player as white
    @player = @white
  end

  def player_turn
    # insert coordinate separated by space
    # validate if coordinate start is a piece and its color is valid
    # then validate destination by check with all possible moves from piece
      # if destination valid (empty or could seize opponent's piece)
      # place piece
      # log moves
      # switch player
  end

  def valid_moves? (destination, moves)
    # check if destination inside movement list
  end

  def get_possible_moves (moves)
    # if a Pawn, check if the row is 2 [idx: 1] or 7 [idx: 6] (get additional step), 
      # add attack moves as well if there is opponent piece in 1 block diagonal
    # if King/Knight check if possible moves blocked by another piece
    # if Queen/Rook/Bishop check if possible moves is blocked in the middle path
  end

  def place_piece (start, destination)
    # set start coordinate to nil
    # set destination to piece
  end

  # input data player and switching player
  def parse_input(input)
    # convert a3 -> [2][0] ([row][column]) / [0, 2] ([column, row])
  end
  
  def input_player(color)
    # print "Insert #{color}'s player name: "
    # name = gets.chomp
    name = "Lorem"

    player = Player.new(name, color)
    if (color == "white")
      @white = player
    else
      @black = player
    end

    # puts "Welcome #{color} army's King, #{name} \n\n"
  end

  def switch_player
    @player = @player.color == "white" ? @black : @white
  end

  # save and load game

  def save_game
    puts "You save the game"
  end

  def load_game
    puts "You load a game"
  end

  # private
  def introduction 
    puts "\n"
    puts "Welcome to Chess game"
    puts "What would you like to do?"
    puts "
    
    * Press [N] to start a new game
    * Press [L] to load saved game

    * Press [E] to exit game
    "

    input = gets.chomp.downcase

    if input == "n"
      start_game
    elsif input == "l"
      load_game
    else
      exit_game
    end
  end

  def instruction
    puts "
                  Welcome to Chess game

    It's a two-player game between White and Black union.
    In order to win the game, you must capture opponent's
    King. If a player couldn't protect his King, game's over.

    White army (the bottom side) always takes the first turn,
    every turn a player only able to do a single move for single
    chess piece.

    To move a chess piece you have to enter start coordinate and
    destination coordinate separated by space i.e. `a1 a3`.
    
    Player could also surrender in the middle of the game,
    by entering `surrender`. Then the player will considered
    as lose.

    You could save the game by entering `save` or exit the 
    game as well by entering `exit` keyword.

    Have fun!
    "
  end

  def log_last_move(start, destination)
    puts "Last move was from #{start} -> #{destination}"
  end

  def invalid_input(input)
    # notify if input invalid, out of box, blocked, or destination is
    # occupied by our own piece

    puts "
      #{input} is not a valid move. It's either blocked by other piece
      or outside the box.

      Try to input again by entering start-destination like: `a1 a3`
      or you could also enter these inputs below: 
      * 'save'        to save the game
      * 'exit'        to exit the game
      * 'surrender'   to surrender, such a loser!
    "
  end

  def exit_game 
    puts "Too bad you chose not to play game. Boooo!"
  end
end

game = Game.new

game.introduction