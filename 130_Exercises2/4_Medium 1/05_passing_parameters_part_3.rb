items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*group, last_el|
  puts group.join(', ')
  puts last_el
end

puts ""

gather(items) do |first_el, *group, last_el|
  puts first_el
  puts group.join(', ')
  puts last_el
end

puts ""

gather(items) do |first_el, *group|
    puts first_el
    puts group.join(', ')
  end

puts ""

gather(items) do |el1, el2, el3, el4|
  puts "#{el1}, #{el2}, #{el3}, #{el4}"
end

