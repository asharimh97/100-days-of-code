puts "How old are you?"

age = gets.chomp.to_i

4.times do |n|
  coming_age = (n + 1) * 10
  puts "In #{coming_age} years you will be:"
  puts age + coming_age
end