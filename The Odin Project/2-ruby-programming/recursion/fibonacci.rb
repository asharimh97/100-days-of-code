def fibs (number)
  fibonacci = [0, 1]

  (number + 1).times do |x|
    if (x > 1)
      fibonacci[x] = fibonacci[x-1] + fibonacci[x-2]
    end
  end

  fibonacci
end

def fibs_rec (number)
  if number == 0
    return [0]
  elsif number == 1
    return [0, 1]
  else
    return fibs_rec(number-1) << fibs_rec(number-1)[-1] + fibs_rec(number-1)[-2]
  end
end

p fibs (5)

p fibs_rec (5)