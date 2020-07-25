require_relative "player"

class Computer < Player
  def intialize
    generate_reference
  end

  def guess_code
    color_guess = Array.new(4).map { |idx| $COLORS[rand(6)] }
    
    @guess_reference.each_with_index do |g, idx|
      color_guess[idx] = g unless g.empty?
    end

    puts "Computer guess : #{color_guess.join(" ")}"

    color_guess
  end

  def generate_reference
    @guess_reference = Array.new(4, "")
  end

  def update_reference (color, position)
    @guess_reference[position] = color
  end
end