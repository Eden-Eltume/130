=begin
Problem - given an array and a desired data structure
          yield each element to a block that adds each (based on rule) to the desrired data structure
Approach - Iterate through array
            - yield each element
            - yield data structure
         - return final value of object
=end

def each_with_object(arr, ds)
  arr.each do |el|
    yield(el, ds)
  end
  ds
end

result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}