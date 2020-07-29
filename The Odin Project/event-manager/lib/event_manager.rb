require "csv"
require "google/apis/civicinfo_v2"
require "erb"

$time_collection = []


def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, "0")[0..4]
end

def clean_phone(number)
  phone = number.scan(/\d/).join

  if phone.length == 10
    phone
  elsif phone.length == 11 && phone[0] == "1"
    phone[0..9]
  else
    "Bad phone number"
  end
end

def convert_time(time)
  date = DateTime.strptime(time, "%m/%d/%y %H:%M")
  $time_collection.push(date)
  
  date
end

def legislators_by_zipcode(zipcode)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = "AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw"
  
  begin
    legislators = civic_info.representative_info_by_address(
      address: zipcode,
      levels: "country",
      roles: ["legislatorUpperBody", "legislatorLowerBody"]
    )
    legislators = legislators.officials
    legislators_name = legislators.map(&:name).join(", ")
    
    legislators
  rescue
    "Oops, Your zipcode is invalid brader!"
  end
end

def generate_file(id, letter)
  Dir.mkdir("output") unless Dir.exist? "output"

  file_name = "output/thanks_#{id}.html"

  File.open(file_name, "w") do |file|
    file.puts letter
  end
end

def get_most_accessed(param)
  date_param = param.to_sym
  max_count = -99

  accessed = $time_collection.reduce({}) do |obj, time|
    obj.has_key?(time.send(date_param)) ? obj[time.send(date_param)] += 1 : obj[time.send(date_param)] = 1
    max_count = obj[time.send(date_param)] if obj[time.send(date_param)] > max_count

    obj
  end
  
  most_optimum_data = accessed.select { |k, v| v == max_count }

  most_optimum_data.keys
end

puts "Event Manager Initialized!"

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

template_letter = File.read "template_letter.erb"
erb_template = ERB.new template_letter

contents.each do |row|
  id = row[0]
  name = "#{row[:first_name]} #{row[:last_name]}"
  zipcode = clean_zipcode(row[:zipcode])
  phone = clean_phone(row[:homephone])
  time = convert_time(row[:regdate])
  # legislators = legislators_by_zipcode(zipcode)

  puts "#{name} => #{phone}; #{time}"

  # personal_letter = erb_template.result(binding)

  # generate_file(id, personal_letter)
end

puts "Most accessed hours are at #{get_most_accessed("hour").join(", ")}"

puts "Most accessed day in week is at #{get_most_accessed("wday").join(", ")}"