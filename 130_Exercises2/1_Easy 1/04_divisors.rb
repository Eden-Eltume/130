=begin
Problem - Given an integer return all the factors of it in an array
Approach - Generate a range of integers from 1 to the given integer
         - loop through the range array
          -check to see if given integer is evenly divisible by current num
          -if it is add it to a result array
        - return the result array
=end

def divisors(int)
  range_arr = (1..int).to_a

  result = []

  range_arr.each{|num| result.push(num) if int % num == 0 }

  result
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute