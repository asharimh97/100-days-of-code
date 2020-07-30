$COLORS = %w[red blue yellow black white green]

class Player
  attr_reader :color_code, :color_code_map
  # generate code automatically
  def generate_code
    @color_code = Array.new(4).map { |idx| $COLORS[rand(6)] }
    @color_code_map = @color_code.reduce({}) do |map, color|
      map.has_key?(color) ? map[color] += 1 : map[color] = 1
      map
    end
  end

  def guess_code; end
end