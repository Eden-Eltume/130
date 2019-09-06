def each_with_index(arr)
  arr.each do |el|
    idx = arr.index(el)
    yield(el, idx)
  end
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]