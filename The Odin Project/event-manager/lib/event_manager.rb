require "csv"

def clean_zipcode(zipcode)
  if zipcode.nil?
    "00000"
  elsif zipcode.length < 5
    zipcode.rjust 5, "0"
  else
    zipcode[0..4]
  end
end

puts "Event Manager Initialized!"

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

contents.each do |row|
  name = "#{row[:first_name]} #{row[:last_name]}"
  zipcode = clean_zipcode(row[:zipcode])

  puts "Name: #{name}, Zipcode: #{zipcode}"
end