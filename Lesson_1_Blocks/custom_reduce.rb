def reduce(array, default = 0)
  counter = 0
  acc = default
  
  while counter < array.size
    current_element = array[counter]
    acc = yield(acc, current_element)
    counter += 1
  end

  acc
end


array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
#p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass