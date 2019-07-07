def each_with_index(arr)
  arr.each{|el| yield(el, arr.index(el))}
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]