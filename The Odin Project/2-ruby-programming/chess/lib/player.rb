class Player
  attr_accessor :name, :color
  def initialize (name, color)
    @name = name

    # color will be between "white" and "black"
    @color = color
  end
end