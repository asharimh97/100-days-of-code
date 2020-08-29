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

    # variables used when game played
    @current_piece = nil
  end

  def start_game
    instruction

    @board.to_s

    puts "You start a new game"
    input_player("white")
    input_player("black")

    # init player as white
    @player = @white

    player_turn
  end

  def player_turn
    # insert coordinate separated by space
    input_instruction
    print "Your move: "
    input = gets.chomp.split(" ")
    start = parse_input(input[0])
    destination = parse_input(input[1])

    # validate if coordinate start is a piece and its color is valid
    # until valid_piece?
    #   invalid_input
    #   player_turn
    # end

    @current_piece = @board.board[start[1]][start[0]]
    moves = get_possible_moves(@current_piece.possible_moves(start))

    if valid_move?(destination, moves)
      puts "Destination valid"
    else
      puts "Destination tidak valid kawanku"
    end

    # then validate destination by check with all possible moves from piece
      # if destination valid (empty or could seize opponent's piece)
      # place piece
      # log moves
      # switch player
  end

  def valid_piece? (position)
    col, row = position
    piece = @board.board[row][col]

    unless piece.nil?
      return true if piece.color == @player.color
    end

    false
  end

  def opponent_piece? (position)
    col, row = position
    piece = @board.board[row][col]

    unless piece.nil? 
      return true unless piece.color == @player.color
    end

    false
  end

  def valid_move? (destination, moves)
    # check if destination inside movement list
    moves.find { |move| move == destination }
  end

  def get_possible_moves (moves = [])
    possible_moves = []
    piece = @current_piece
    
    # if a Pawn, check if the row is 2 [idx: 1] or 7 [idx: 6] (get additional step)
      # add attack moves as well if there is opponent piece in 1 block diagonal
    # if King/Knight check if possible moves blocked by another piece
    # if Queen/Rook/Bishop check if possible moves is blocked in the middle path
    if piece.kind_of? Pawn
      possible_moves = get_pawn_moves(moves)
      piece.attack_moves.each do |move|
        possible_moves.push(move) if opponent_piece?(move)
      end
    elsif (piece.kind_of?(King) || piece.kind_of?(Knight))
      possible_moves = get_clear_moves(moves)
    else
      possible_moves = get_incremental_clear_moves(moves)
    end

    #return array of possible moves
    possible_moves
  end

  def get_pawn_moves (moves)
    piece_moves = []
    board = @board.board
    moves.each do |move|
      col, row = move
      piece_moves.push(move) if board[row][col].nil?
    end

    piece_moves
  end

  def get_clear_moves (moves)
    piece_moves = []
    board = @board.board
    moves.each do |move|
      if valid_piece? (move)
        break
      elsif opponent_piece? (move)
        piece_moves.push(move)
        break
      end
      piece_moves.push(move)
    end

    piece_moves
  end

  def get_incremental_clear_moves (moves)
    piece_moves = []
    board = @board.board

    moves.each do |direction|
      direction.each do |move|
        if valid_piece? (move)
          break
        elsif opponent_piece? (move)
          piece_moves.push(move)
          break
        end

        piece_moves.push(move)
      end
    end

    piece_moves
  end

  def place_piece (start, destination)
    # set start coordinate to nil
    # set destination to piece
    col1, row1 = start
    col2, row2 = destination

    @board.board[row2][col2] = @current_piece
    @board.board[row1][col1] = nil
  end

  # input data player and switching player
  def parse_input(input)
    # convert a3 -> [2][0] ([row][column]) / [0, 2] ([column, row])
    col, row = input.split("")
    cols = {
      "a" => 0,
      "b" => 1,
      "c" => 2,
      "d" => 3,
      "e" => 4,
      "f" => 5,
      "g" => 6,
      "h" => 7,
    }

    col = cols[col]
    row = row.to_i - 1

    [col, row]
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

  def input_instruction
    puts "It's #{@player.color}'s turn!"
    puts "Remember the input format is `start` `destination`: a1 a3"
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