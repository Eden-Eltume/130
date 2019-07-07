def step(start, finish, increment)
  arr = (start..finish).to_a

  idx = 0
  loop do
    current_el = arr[idx]
    break if idx > arr.size
    yield(current_el)
    idx += increment
  end
  arr
end

p step(1, 10, 3) { |value| puts "value = #{value}" }