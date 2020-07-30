def caesar_chiper (word, shifter)
  alphabet = ("a".."z").to_a
  new_word = word.split("").map do |w|
    if (/[A-Za-z]/.match(w))
      idx = alphabet.find_index{ |a| a == w.downcase }

      new_idx = (idx + shifter) % 26
      w.ord <= 90 ? alphabet[new_idx].upcase : alphabet[new_idx]
    else
      w
    end
  end

  return new_word.join
end

puts caesar_chiper("Hello, World!", -29)