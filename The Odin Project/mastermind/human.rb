require_relative "player"

class Human < Player
  def intialize
    @player_type = "human"
  end

  def guess_code
    guess = gets.chomp.split(" ")

    guess
  end

  def create_code
    puts "Create your color code..."
    code = gets.chomp.split(" ")

    code
  end
end