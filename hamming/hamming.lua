local Hamming = {}

Hamming.compute = function(a, b)
  assert(type(a) == 'string', "strand `a` must be a string")
  assert(type(b) == 'string', "strand `b` must be a string")
  local hamming_d = 0
  if string.len(a) ~= string.len(b) then
    --error("the strands have not the same length")
    hamming_d = -1
  else
    for i = 1, #a do
      local c_a = a:sub(i, i)
      local c_b = b:sub(i, i)
      if c_a ~= c_b then
        hamming_d = hamming_d + 1
      end
    end
  end
  return hamming_d
end

return Hamming
