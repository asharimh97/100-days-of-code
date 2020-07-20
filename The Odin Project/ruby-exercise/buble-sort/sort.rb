def buble_sort(arr)
  swapped = true

  while swapped do
    swapped = false
    (1..arr.length - 1).each do |i|
      if (arr[i - 1] > arr[i])
        # to swap value use this and forget about store it in temp
        arr[i], arr[i - 1] = arr[i-1], arr[i] 
        # p arr
        swapped = true
      end
    end
  end

  return arr
end

array = [7, 10, 1, 3, 4, 12, 17, 0]

p buble_sort(array)