vim.api.nvim_create_user_command('Compile', function(opts)
    require('compile').compile(opts)
end, { nargs = '+' })

vim.api.nvim_create_user_command('Recompile', function(opts)
    require('compile').recompile(opts)
end, {})
