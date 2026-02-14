local Compile = {
    last_compile_cmd = nil,
}

function Compile:setup(_)
    vim.api.nvim_create_user_command('Compile', function(opts)
        Compile:Compile(opts)
    end, { nargs = '+' })

    vim.api.nvim_create_user_command('Recompile', function(opts)
        Compile:Recompile(opts)
    end, {})
end

function Compile:RunMake(cmd)
    local save_makeprg = vim.bo.makeprg
    vim.bo.makeprg = cmd
    vim.cmd(':make')
    vim.bo.makeprg = save_makeprg
end

function Compile:Compile(opts)
    local cmd = table.concat(opts.fargs, ' ', 1)
    Compile:RunMake(cmd)

    self.last_compile_cmd = cmd
end

function Compile:Recompile(_)
    if self.last_compile_cmd == nil then
        print('Cannot :Recompile without :Compile first')
        return
    end

    Compile:RunMake(self.last_compile_cmd)
end

return Compile
