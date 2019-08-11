def compute
  if block_given?
    block_val = yield
    return block_val
  end

  "Does not compute."
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'