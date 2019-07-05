=begin
Identify start to finish:
  -Find min and max
Increment from min to max
Add each element to a new array
Return the difference of the original and new array
=end

def missing(arr)
  min = arr.min
  max = arr.max

  full_arr = [min]

  counter = 1
  loop do
    break if full_arr.last == max
    next_num = min + counter
    full_arr.push(next_num)
    counter += 1
  end

  dif_arr = full_arr - arr
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []