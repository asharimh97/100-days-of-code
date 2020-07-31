class Hangman
  DICTIONARY_PATH = "./assets/5desk.txt"
  @keywords = File.readlines DICTIONARY_PATH

  def initialize
    greeting
  end

  def greeting
    puts "-----------------------------"
    puts "#                           #" 
    puts "#  Welcome to Hangman game  #"
    puts "#                           #"
    puts "-----------------------------"
    puts "\n"
    
    puts " |---|"
    puts " |   O"
    puts " |  /|\\"
    puts " |   |"
    puts " |  / \\"
    puts " |"
    puts "_|___|"
    puts "\n"

    puts "[1] Start new game"
    puts "[2] Load game"
  end

  def select_word
    keywords = @keywords.select { |x| x.length.between?(5, 12) }
    total_keywords = keywords.length

    @secret_word = keywords[rand(total_keywords)].strip
    puts generate_stripes(@secret_word)
  end

  def generate_stripes(word)
    word.gsub(/[\w]/, "_")
  end
end

word = Hangman.new

# word = select_word()

# puts word
# puts generate_stripes(word)
# puts print_greeting()