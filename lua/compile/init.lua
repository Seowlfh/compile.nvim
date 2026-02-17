local Compile = {
    last_compile_cmd = nil,
}

function Compile.setup(_) end

function Compile.run_make(cmd)
    local save_makeprg = vim.bo.makeprg
    vim.bo.makeprg = cmd
    vim.cmd(':make')
    vim.bo.makeprg = save_makeprg
end

function Compile.compile(opts)
    opts = opts or {}
    local cmd = table.concat(opts.fargs, ' ', 1)
    Compile.run_make(cmd)

    Compile.last_compile_cmd = cmd
end

function Compile.recompile(_)
    if Compile.last_compile_cmd == nil then
        print('Cannot :Recompile without :Compile first')
        return
    end

    Compile.run_make(Compile.last_compile_cmd)
end

return Compile
