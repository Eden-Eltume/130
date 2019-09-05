=begin
Problem - given an array as an argument, and a block. Return a new array that contains the return values produced by the block for each element of the original Array.
Approach - Use each_with_object
            - yield each element of the arr
            - return the result as an Array
=end

def map(arr)
  arr.each_with_object([]) do |el, new_arr|
    new_arr << yield(el)
  end
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]