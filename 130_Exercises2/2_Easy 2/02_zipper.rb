def zip(arr1, arr2)
  result = []
 
  arr1.each{|el| result << [el]}
  
  counter = 0
  arr2.each do |el|
    result[counter].push(el)
    counter += 1
  end

  result
end