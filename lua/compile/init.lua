local Compile = {
    last_compile_cmd = nil,
}

function Compile.setup(_) end

function Compile.RunMake(cmd)
    local save_makeprg = vim.bo.makeprg
    vim.bo.makeprg = cmd
    vim.cmd(':make')
    vim.bo.makeprg = save_makeprg
end

function Compile.Compile(opts)
    local cmd = table.concat(opts.fargs, ' ', 1)
    Compile.RunMake(cmd)

    Compile.last_compile_cmd = cmd
end

function Compile.Recompile(_)
    if Compile.last_compile_cmd == nil then
        print('Cannot :Recompile without :Compile first')
        return
    end

    Compile.RunMake(Compile.last_compile_cmd)
end

return Compile
