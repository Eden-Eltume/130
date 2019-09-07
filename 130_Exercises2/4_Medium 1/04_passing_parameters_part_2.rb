def array_splat(arr)
  yield(arr)
end

array_splat([1,2,"b","c"]) do |_, _, *group|
  p group
end