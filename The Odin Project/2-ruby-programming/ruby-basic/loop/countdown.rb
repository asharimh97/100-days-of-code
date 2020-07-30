def countdown (number)
  if (number <= 0) 
    puts number
    # yang penting udah enggak manggil fungsi ini sendiri lagi
  else
    puts number
    countdown(number - 1)
  end
end

puts "Countdown start from?"
number = gets.chomp.to_i

puts countdown(number)