=begin
Problem - return the missing number from the argument array
Approach - create array between min and max of argument array
         - return the different between the new array and the argument array
=end

def missing(incomplete_arr)
  min_num = incomplete_arr.min
  max_num = incomplete_arr.max

  full_arr = (min_num..max_num).to_a
  full_arr - incomplete_arr
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []