def substrings (words, dictionary)
  substring = {}

  words.split(" ").each do |word| 
    word = word.gsub(/[!,?']/, '').downcase

    dictionary.each do |w|
      if word.include?(w) 
        substring[w] = substring[w] ? substring[w] + 1 : 1 
      end
    end
  end

  substring
end

dictionary = ["below","down", "go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

p substrings("helow below low", dictionary);
p substrings("Howdy partner, sit down! How's it going?", dictionary);