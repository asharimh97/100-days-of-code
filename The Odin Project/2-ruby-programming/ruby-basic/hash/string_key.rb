person = {
  "name" => "John Doe",
  "address" => {
    "place_name" => "Monas",
    "city" => "Central Jakarta",
    "province" => "DKI Jakarta",
    "formatted_address" => "Jakarta Pusat, Kayaknya Jalan Medan Merdeka"
  }
}

person_2 = {
  name: "Lorem Ipsum",
  address: {
    place_name: "Medan Merdeka",
    city: "Medan",
    province: "Sumatra Utara",
    formatted_address: "MEdan Horas!"
  }
}

person_2[:name] = "Sherlock Holmes"
person_2[:lorem] = "Ipsum"
person_2.delete(:lorem)

persons = [].push(person).push(person_2)

puts person["address"]["place_name"], person_2[:name], persons[1]