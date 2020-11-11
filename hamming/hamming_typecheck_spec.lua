local compute = require('hamming').compute

describe('hamming function typechecking', function()
  
  it('should assert that parameter `a` is a string', function()
    local errfn = function()
      compute(0, 'A')
    end
    assert.has.errors(errfn, "strand `a` must be a string")
  end)

  it('should assert that parameter `b` is a string', function()
    local errfn = function()
      compute('A', 0)
    end
    assert.has.errors(errfn, "strand `b` must be a string")
  end)

end)
