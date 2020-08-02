require "yaml"

class Hangman
  DICTIONARY_PATH = "./assets/5desk.txt"
  $keywords = File.readlines DICTIONARY_PATH

  def initialize
    # store guessed chars
    @guessed_chars = []

    #other variables
    @correct_chars = ""
    @game_over = false
    @chances = 0
    @secret_word = ""
    @striped_word = ""

    greeting

    choice = gets.chomp

    case choice
    when "1"
      puts "Let's start the game. The secret word is:"
      puts "\n"
      start_game
    when "2"
      load_game
    else
      puts "Uh oh, answer is invalid"
    end
  end

  def start_game
    select_word
    play_game
  end

  def play_game
    while (@chances > 0 && @game_over == false) do
      if @chances < @secret_word.length
        puts @striped_word
        display_remaining_chances 
        puts "Guessed chars: #{@guessed_chars.join(", ")}"
        display_choices
      end
      guess_word

      # regenerate striped word
      generate_stripes

      check_answer
    end

    announce_result
  end

  def guess_word
    print  "Enter a char: "
    guess = gets.chomp

    if guess.downcase == "exit"
      exit_game
    elsif guess.downcase == "save"
      save_game
    else
      guess = guess[0]

      unless @guessed_chars.include? (guess)
        if @secret_word.include? (guess)
          @correct_chars += guess
        end
        @guessed_chars.push(guess)
        @chances -= 1
      else
        puts "Chars has been used, can't be reused"
      end
      puts 
    end

  end

  def check_answer
    @game_over = @striped_word == @secret_word
  end

  def save_game
    print "Insert file name: "
    name = gets.chomp

    puts "Saving game data..."
    
    Dir.mkdir("saved_games") unless Dir.exist? "saved_games"

    file_name = "saved_games/#{name}.yaml"

    File.open(file_name, "w") { |file| file.write save_yaml_data }

    puts "Game saved"
    puts 
  end

  def save_yaml_data
    game_data = {
      secret_word: @secret_word,
      striped_word: @striped_word,
      correct_chars: @correct_chars,
      guessed_chars: @guessed_chars,
      chances: @chances
    }

    YAML.dump(game_data)
  end

  def load_game
    # set secret word and display stripes
    # play game
    puts "All saved games:"
    puts Dir.entries("saved_games")[2..-1].map { |file| "- #{file}" }
    puts "Select the saved game by type the file name (without yaml): "

    file_name = gets.chomp

    if File.exist? ("saved_games/#{file_name}.yaml")
      puts "Loading game..."
      game_data = YAML.load_file ("saved_games/#{file_name}.yaml")
      load_saved_game(game_data)
      puts "Game loaded"
      puts 

      play_game
    else
      puts "File not exist. Exitting game."
    end
  end

  def load_saved_game(data)
    @secret_word = data[:secret_word]
    @striped_word = data[:striped_word]
    @correct_chars = data[:correct_chars]
    @guessed_chars = data[:guessed_chars]
    @chances = data[:chances]
  end

  def select_word
    keywords = $keywords.select { |x| x.length.between?(5, 12) }
    total_keywords = keywords.length

    @secret_word = keywords[rand(total_keywords)].strip
    @chances = @secret_word.length
    puts generate_stripes
    display_remaining_chances
  end

  def generate_stripes
    word = @secret_word
    @striped_word = word.gsub(/[\w]/, "_")
    
    @striped_word = word.gsub(/[^#{@correct_chars}]/, "_") if @correct_chars.length > 0

    @striped_word
  end

  # non technical methods lay here

  def display_remaining_chances
    puts "You have #{@chances} chance(s) to guess"
  end

  def display_choices
    puts "save = Save game"
    puts "exit = End the game, admit as loser!"
  end

  def greeting
    puts "-----------------------------"
    puts "#                           #" 
    puts "#  Welcome to Hangman game  #"
    puts "#                           #"
    puts "-----------------------------"
    puts "\n"
    
    display_hangman

    puts "[1] Start new game"
    puts "[2] Load game"
  end

  def display_hangman
    puts " |---|"
    puts " |   O"
    puts " |  /|\\"
    puts " |   |"
    puts " |  / \\"
    puts " |"
    puts "_|___|"
    puts "\n"
  end

  def announce_result 
    if @game_over
      puts @secret_word
      puts "You guessed it right on the spot!" 
    else
      puts "Too bad! The correct answer is #{@secret_word}"
    end
  end

  def exit_game
    @chances = 0
  end
end

word = Hangman.new