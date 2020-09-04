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
    @check = false
    @victory = false
    @game_over = false

    # map variables to ease check determination
    @king_position = {
      "white" => nil,
      "black" => nil
    }
    @pieces_positions = {
      "white" => [],
      "black" => []
    }
  end

  def start_game
    instruction
    
    # generate piece map position
    generate_positions

    # print initial board

    puts "You start a new game"
    input_player("white")
    input_player("black")

    # init player as white
    @player = @white

    until @victory do
      # print board
      @board.to_s

      # player play
      player_turn

      # check if check mate
      check?

      # switch player
      switch_player
    end

    puts "Game's over!"
  end

  def generate_positions
    board = @board.board
    board.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        unless col.nil?
          @pieces_positions[col.color].push([col_index, row_index])
          @king_position[col.color] = [col_index, row_index] if col.kind_of?(King)
        end
      end
    end

    col, row = parse_input("d5")
    @board.board[row][col] = Knight.new("black")
  end

  def regenerate_pieces (start, destination)
    # regenerate map pieces based on player color
    pieces = @pieces_positions[@player.color].filter { |pos| pos != start }
    pieces.push(destination)

    @pieces_positions[@player.color] = pieces
  end

  def move_king (position)
    # move king destination based on player color
    @king_position[@player.color] = position
  end

  def player_turn
    # insert coordinate separated by space
    input_instruction
    print "Your move: "
    input = gets.chomp.split(" ")
    start = parse_input(input[0])
    destination = parse_input(input[1])

    # validate if coordinate start is a piece and its color is valid
    unless valid_piece?(start)
      invalid_input(start)
      return player_turn
    end

    @current_piece = @board.board[start[1]][start[0]]
    moves = get_possible_moves(@current_piece.possible_moves(start))

    if valid_move?(destination, moves)
      place_piece(start, destination)
      log_last_move(input[0], input[1])
    else
      invalid_input(destination)
      return player_turn
    end

    # then validate destination by check with all possible moves from piece
      # if destination valid (empty or could seize opponent's piece)
      # place piece
      # log moves
      # switch player
  end

  def valid_piece? (position, color = @player.color)
    col, row = position
    piece = @board.board[row][col]

    unless piece.nil?
      return true if piece.color == color
    end

    false
  end

  def opponent_piece? (position, color = @player.color)
    col, row = position
    piece = @board.board[row][col]

    unless piece.nil? 
      return true unless piece.color == color
    end

    false
  end

  def valid_move? (destination, moves)
    # check if destination inside movement list
    moves.find { |move| move == destination }
  end

  def get_possible_moves (moves = [], piece = @current_piece)
    possible_moves = []
    
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

  def get_checked_king_moves (moves, piece = @current_piece) 
    possible_moves = []

    board = @board.board
    moves.each do |move|
      col, row = move
      possible_moves.push(move) if (board[row][col].nil? || opponent_piece?(move, piece.color))
    end

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
      col, row = move
      if (opponent_piece?(move) || @board.board[row][col].nil?)
        piece_moves.push(move)
      end
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

    promote if promotable?(destination)

    # regenerate new map piece
    regenerate_pieces(start, destination)
    move_king(destination) if @current_piece.kind_of? King
  end

  def promotable? (position)
    if @current_piece.kind_of?(Pawn)
      col, row = position
      return true if (row == 0 || row == 7)
    end

    false
  end

  def promote (position)
    puts "Your pawn is promotable, please choose new job to your pawn: "
    puts "[1] Queen     [2] Bishop      [3] Knight      [4] Rook"
    promotions = {
      1 => Queen.new,
      2 => Bishop.new,
      3 => Knight.new,
      4 => Rook.new
    }

    input = gets.chomp.to_i

    promote unless (1..4).include?(input)

    col, row = position
    @board.board[row][col] = promotions[input]
  end

  def check? 
    player_color = @player.color
    opponent_color = player_color == "black" ? "white" : "black"
    opponent_king = @king_position[opponent_color]

    player_moves = []

    # generate every current player moves then compare if there's any single opponent
    # get all player moves
    @pieces_positions[player_color].each do |position|
      col, row = position
      current_piece = @board.board[row][col]
      piece_moves = current_piece.nil? ? [] :  get_possible_moves(current_piece.possible_moves(position), current_piece)

      player_moves = player_moves.concat(piece_moves)
    end

    # king inside pieces possible moves, then it's a check
    if player_moves.include? opponent_king
      # check mate, end game
      @check = true
      if mate?(player_moves, opponent_king)
        puts "CHECKMATE!"
        @victory = true
      else
        puts "CHECK!"
        @victory = false
      end

      return true
    end

    false
  end

  def mate? (moves, king_position)
    col, row = king_position
    king = @board.board[row][col]
    king_moves = get_checked_king_moves(king.possible_moves(king_position), king)

    # check if all opponent king's movement is surrounded
    king_moves.all? { |move| moves.include? move }
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

  def reverse_parse (input)
    col, row = input
    cols = {
      0 => "a",
      1 => "b",
      2 => "c",
      3 => "d",
      4 => "e",
      5 => "f",
      6 => "g",
      7 => "h",
    }

    col = cols[col]
    row = row.to_i + 1

    "#{col}#{row}"
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
      #{reverse_parse(input)} is not a valid move. It's either blocked by other piece
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