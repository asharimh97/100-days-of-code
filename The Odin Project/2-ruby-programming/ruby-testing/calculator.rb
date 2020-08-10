class Calculator
  def add (*numbers)
    sum = numbers.reduce (0) { |total, number| number + total }
    
    sum
  end

  def subtract (initial_number, *numbers)
    sum = numbers.reduce (initial_number) { |total, number| total - number }
    
    sum
  end

  def multiply (*numbers)
    sum = numbers.reduce (1) { |total, number| number * total }
    
    sum
  end

  def divide (initial_number, *numbers)
    sum = numbers.reduce (initial_number) { |total, number| total / number }
    
    sum
  end
end