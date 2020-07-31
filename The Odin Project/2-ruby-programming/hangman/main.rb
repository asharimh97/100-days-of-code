dictionaries = "./assets/5desk.txt"
$keywords = File.readlines dictionaries

def select_word
  keywords = $keywords.select { |x| x.length.between?(5, 12) }
  total_keywords = keywords.length

  keywords[rand(total_keywords)].strip
end

def generate_stripes(word)
  word.gsub(/[\w]/, "_")
end

word = select_word()

puts word
puts generate_stripes(word)