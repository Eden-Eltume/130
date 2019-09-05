=begin
Problem - take a list of arguments and return the number of times for which the block returns true
Approach - Take an arbitrary number of arguments
         - Have a counter variable
         - Pass each argument into the yield block
            - Increment the counter variable if it returns true
        - Return the counter variable
=end

def count(*nums)
  counter = 0
  nums.each{|num| counter += 1 if yield(num)}
  counter
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3
