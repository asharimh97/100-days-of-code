person = {
  first_name: "John",
  last_name: "Doe",
  age: 19,
  nationality: "Ireland"
}

person.each_key do |key|
  puts "Key: #{key}"
end

person.each_value do |value|
  puts "Value: #{value}"
end

puts "\nPlayer info: \n"

person.each do |key, value|
  puts "#{key}: #{value}"
end