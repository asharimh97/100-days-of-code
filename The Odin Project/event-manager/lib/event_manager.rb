puts "Event Manager Initialized!"

contents = File.read "event_attendees.csv"

lines = File.readlines "event_attendees.csv"

lines.each_with_index do |attendee, idx|
  next if idx == 0
  detail_attendee = attendee.split(",")

  puts "Name: #{detail_attendee[2]}"
end