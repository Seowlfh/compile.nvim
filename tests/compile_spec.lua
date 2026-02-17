local compile = require('compile')

local eq = assert.are.same

describe('compile.compile', function()
    it('should do stuff', function()
        compile.compile({
            fargs = {
                'echo',
                'toto',
            },
        })

        eq('echo toto', compile.last_compile_cmd)
    end)
end)
