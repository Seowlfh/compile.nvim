vim.api.nvim_create_user_command('Compile', function(opts)
    require('compile').Compile(opts)
end, { nargs = '+' })

vim.api.nvim_create_user_command('Recompile', function(opts)
    require('compile').Recompile(opts)
end, {})
