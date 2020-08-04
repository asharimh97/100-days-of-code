def merge_sort (arr)
  return arr if arr.length <= 1

  left = []
  right = []
  arr.each_with_index do |x, i|
    if i < arr.length / 2
      left.push(x)
    else
      right.push(x)
    end
  end
  
  left = merge_sort(left)
  right = merge_sort(right)

  merge(left, right)
end

def merge (left, right)
  res = []

  while left.length > 0 && right.length > 0 do
    if (left[0] < right[0])
      res.push(left[0])
      left.shift
    else
      res.push(right[0])
      right.shift
    end
  end

  while left.length > 0 do
    res.push(left[0])
    left.shift
  end

  while right.length > 0 do
    res.push(right[0])
    right.shift
  end

  res
end

arr = [3, 10, 7, 11, 2, 9, -11, 999, 7]

p merge_sort(arr)