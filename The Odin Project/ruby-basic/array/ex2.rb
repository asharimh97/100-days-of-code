arr = ["b", "a"].product(Array(1..3))
arr.first.delete(arr.first.last)

puts "#{arr}"

arr = ["b", "a"].product([Array(1..3)])
arr.first.delete(arr.first.last)

puts arr.to_s