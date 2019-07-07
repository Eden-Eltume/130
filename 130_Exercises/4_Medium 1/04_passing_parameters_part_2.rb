def the_rest(arr)
  yield(arr)
end

birds = %w(raven finch hawk eagle)

the_rest(birds){|list| puts "Raptors: #{list[2..-1].join(', ')}." }