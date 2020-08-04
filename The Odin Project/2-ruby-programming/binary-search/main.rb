def binary_search(number, arr)
  left = 0
  mid = arr.length / 2
  right = arr.length - 1
  search_arr = arr.sort

  while left < right do
    if (number == search_arr[mid])
      break
    elsif number > search_arr[mid]
      left = mid + 1
      mid = (mid + right) / 2
    elsif number < search_arr[mid]
      right = mid - 1
      mid = (left + right) / 2
    end
  end

  p search_arr
  if (number == search_arr[mid])
    "The number you are looking for is in the array"
  else
    "Number is not in the array, buddy"
  end
end

arr = [3, 10, 7, 11, 2, 9, -11, 999, 7]
number = 70

p binary_search(number, arr)