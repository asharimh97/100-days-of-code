class Game
  COLORS = %w[red blue yellow black white green]
  def initialize
    @chances = 12
    @game_over = false

    generate_color

    puts "Try to guess color sequence. e.g. red blue green yellow"
    puts "Available color: red, blue, yellow, green, black, white\n"

    guess_color until @game_over
  end

  def guess_color
    chances_over if @chances == 0
    
    puts "You have #{@chances} chance(s) left"
    @chances -= 1
    guess = gets.chomp.split(" ")
    
    
    check_answer(guess)
  end

  def check_answer(colors)
    color_map = @color_code_map.clone
    correct = true

    colors.each_with_index do |color, idx|
      if (color == @color_code[idx])
        correct_color_position(color, idx)
        color_map[color] -= 1
      elsif color_map.has_key? (color)
        correct_color(color) if color_map[color] > 0
      end
    end

    color_map.each_value do |color|
      unless color == 0
        correct = false
        break
      end
    end

    correct_answer if correct
  end

  private
  def generate_color
    @color_code = Array.new(4).map { |idx| COLORS[rand(6)] }
    @color_code_map = @color_code.reduce({}) do |map, color|
      map.has_key?(color) ? map[color] += 1 : map[color] = 1
      map
    end

    p @color_code
  end

  def correct_answer
    @game_over = true
    puts "Congratulations! The answer is correct"
  end

  def correct_color_position(color, idx)
    puts "Your color guess for position #{idx} is correct. It's #{color}"
  end

  def correct_color(color)
    puts "The color is on sequence but not in this position. Try again."
  end

  def chances_over
    @game_over = true
    puts "Last chances baby!"
  end
end

game = Game.new
