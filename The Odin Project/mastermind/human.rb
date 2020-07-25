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
    puts "Consist of 4 color, e.g. red blue green yellow"
    puts "Color available #{$COLORS.join(" ")}"

    code = gets.chomp.split(" ")

    convert_code_to_map(code)
  end

  def convert_code_to_map(colors)
    @color_code = colors
    @color_code_map = colors.reduce({}) do |map, color|
      map.has_key?(color) ? map[color] += 1 : map[color] = 1
      map
    end
  end
end