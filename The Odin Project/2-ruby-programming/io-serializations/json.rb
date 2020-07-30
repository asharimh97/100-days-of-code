require "json"

data = {
  name: "Sherlock Holmes",
  occupation: "Detective",
  address: {
    street: "221B Baker Street",
    city: "London",
    country: "UK"
  }
}

watson = JSON.load File.read("./files/watson.json")

json_data = JSON.dump(data)

parsed_data = JSON.load json_data

p data, json_data, parsed_data, watson