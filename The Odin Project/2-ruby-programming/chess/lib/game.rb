require_relative "./board"
require_relative "./player"
Dir[File.join(__dir__, "pieces", "*.rb")].each {|file| require_relative file }

class Game
  attr_accessor :board, :player, :white, :black

  def initialize
    @board = Board.new
    @white = Player.new("white")
    @black = Player.new("black")
    @player = @white
  end
end