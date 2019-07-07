def zip(arr1, arr2)
  new_arr = []

  counter = 0
  loop do
    break if counter >= arr1.size && counter >= arr2.size
    new_arr << yield(arr1[counter], arr2[counter])
    counter += 1
  end

  new_arr
end

p zip([1, 2, 3], [4, 5, 6]){|el1, el2| [el1, el2]} == [[1, 4], [2, 5], [3, 6]]