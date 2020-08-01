class Hangman
  DICTIONARY_PATH = "./assets/5desk.txt"
  $keywords = File.readlines DICTIONARY_PATH

  def initialize
    # store guessed chars
    @guessed_chars = []
    @correct_chars = ""
    @game_over = false

    greeting

    choice = gets.chomp

    case choice
    when "1"
      puts "Let's start the game. The secret word is:"
      puts "\n"
      start_game
    when "2"
      puts "Load save game"
    else
      puts "Uh oh, answer is invalid"
    end
  end

  def start_game
    x = 0
    select_word
    while (@chances > 0 && @game_over == false) do
      if x > 0
        puts @striped_word
        display_remaining_chances 
        puts "Guessed chars: #{@guessed_chars.join(", ")}"
      end
      guess_word

      # regenerate striped word
      generate_stripes

      check_answer
      x += 1
    end

    announce_result
  end

  def guess_word
    guess = gets.chomp[0]

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

  def check_answer
    @game_over = @striped_word == @secret_word
  end

  def save_game
  end

  def load_game
    # set secret word and display stripes
    # set 
  end

  def select_word
    keywords = $keywords.select { |x| x.length.between?(5, 12) }
    total_keywords = keywords.length

    @secret_word = keywords[rand(total_keywords)].strip
    @chances = @secret_word.length
    puts @secret_word
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
end

word = Hangman.new