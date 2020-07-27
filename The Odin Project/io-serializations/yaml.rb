require "yaml"

data = {
  name: "Sherlock Holmes",
  occupation: "Detective",
  address: {
    street: "221B Baker Street",
    city: "London",
    country: "UK"
  }
}

moriarity = YAML.load File.read("./files/moriarty.yaml")

yaml_data = YAML.dump(data)

parsed_data = YAML.load yaml_data

p data, yaml_data, parsed_data, moriarity

puts moriarity["name"]