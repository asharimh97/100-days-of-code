require_relative "human"
require_relative "computer"

class Game
  COLORS = %w[red blue yellow black white green]
  MODE = {"1" => "breaker", "2" => "maker"}
  def initialize
    @chances = 12
    @game_over = false

    @player = Human.new
    @computer = Computer.new

    puts "Welcome to 'Mastermind' game\n\n"
    puts "Try to guess color sequence. e.g. red blue green yellow"
    puts "Available color: red, blue, yellow, green, black, white\n\n"

    select_mode

    start_game
  end

  def start_game
    chances = 12
    player = @mode == "breaker" ? "You" : "Computer"
    puts "In this game you will play as #{@mode}"

    generate_code

    chances.times do |i|
      puts "\n#{player} have #{chances - i} chance(s) left..."
      
      # if mode breaker, computer generate code, player guess until correct/chances == 0
      # if mode maker, player choose to auto generate color or create color code
      # then computer guess until correct/chances == 0

      if @mode == "breaker"
        human_play
      else
        computer_play
      end

      break if @game_over
      
    end

    chances_over unless @game_over
  end

  def human_play
    puts "Your gues..."
    guess = @player.guess_code

    check_answer(guess)
  end

  def computer_play
    puts "Computer will try to guess..."
    guess = @computer.guess_code

    check_answer(guess)

    sleep 3
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
  def select_mode 
    puts "Select game mode: \n1) play as breaker\n2) play as maker\n"
    mode = gets.chomp()
    @mode = MODE[mode] || MODE["1"]
  end

  def generate_code
    if @mode == "breaker" 
      @computer.generate_code

      @color_code = @computer.color_code
      @color_code_map = @computer.color_code_map
    else
      puts "How will you generate the code?"
      puts "1) Manual\n2) Automatic"

      mode = gets.chomp.to_i

      mode == 1 ? @player.create_code : @player.generate_code
      
      @color_code = @player.color_code
      @color_code_map = @player.color_code_map
    end
  end

  def correct_answer
    @game_over = true
    puts "\nCongratulations! Your guess is hit the right spot!\n\n"
  end

  def correct_color_position(color, position)
    puts "Color #{color} is in the right position"
  end

  def correct_color(color)
    puts "The color #{color} is on sequence but not in this position. Try again."
  end

  def chances_over
    puts "\nYou lose! Your chance is over!\n\n"
  end
end

game = Game.new
