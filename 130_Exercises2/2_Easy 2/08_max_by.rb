=begin
Problem - return the element out of the array that is yields the greatest result
Approach - Map array
           - yield each element
         - select the greatest element from the result
         - find it corresponding index
         -return the element from arr with the corresponding index
=end

def max_by(arr)
  if arr.empty?
    return nil
  else
    result = arr.map{|el| yield(el)}
    max_el = result.max
    arr.fetch(result.index(max_el))
  end
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil