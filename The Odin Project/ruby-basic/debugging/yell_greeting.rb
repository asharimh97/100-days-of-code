require "pry"

def yell_greeting(string)
  name = string

  binding.pry

  name = name.upcase
  greeting = "Hei yo, #{name}"
  puts greeting
end

yell_greeting("John")