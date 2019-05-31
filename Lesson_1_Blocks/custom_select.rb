# take a block and yield each element to the block
# if true, include current element in the returned array
# if false, do not include current element in the return array

def select(array)
  counter = 0
  result = []

  while counter < array.size
    current_element = array[counter]
    yield_return_value = yield(current_element)
    result << current_element if yield_return_value
    counter += 1
  end

  result
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true