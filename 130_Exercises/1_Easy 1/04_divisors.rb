def divisors(num)
  div_arr = []
  1.upto(num) do |i|
    divisor, remainder = num.divmod(i)
    div_arr.unshift(divisor) if remainder == 0
  end

  div_arr
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891]