def step(start_point, endpoint, increment)
  current_value = start_point
  loop do
    yield(current_value)
    break if current_value + increment > endpoint
    current_value += increment
  end
  current_value
end

step(1, 10, 3) { |value| puts "value = #{value}" }