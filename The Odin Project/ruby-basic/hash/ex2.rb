obj = {
  name: "Lorem ipsum",
  age: 19
}

obj_2 = {
  address: {
    place_name: "Jakarta"
  }
}

puts obj.merge(obj_2), obj

obj.merge!(obj_2)

puts obj, obj_2