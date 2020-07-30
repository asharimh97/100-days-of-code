family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

immediate_family = family.select{|key| key == :sisters || key == :brothers}

arr = immediate_family.values.flatten

puts immediate_family, arr