words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

anagram = {}

words.each do |w|
  sorted = w.split("").sort.join
  if (anagram.has_key?(sorted)) 
    anagram[sorted].push(w)
  else
    anagram[sorted] = [w]
  end
end

p anagram.values