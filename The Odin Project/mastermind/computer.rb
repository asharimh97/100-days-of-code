require_relative "player"

class Computer < Player
  def intialize;end

  def guess_code
    color_guess = Array.new(4).map { |idx| $COLORS[rand(6)] }

    puts "Computer guess : #{color_guess.join(" ")}"

    color_guess
  end
end