# Compile.nvim

Small plugin to compile arbitrary commands, and populates the quickfixlist with
the output. Provides 2 commands:
- `:Compile`: Compiles a command (run it, and sent the output to the
  quickfixlist)
- `:Recompile`: Recompiles the last command

This is done by temporarily chaning the `makeprg` variable, and calling `:make`.
Hey I told you it was small.

I've done since both for fun and because we lack a good way to make use of
`:make` with arbitrary commands. Emacs' compilation mode is pretty neat in that
regard, and that's where the compile/recompile comes from.

## Installation

Installation with [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
    "Seowlfh/compile.nvim"
    keys = {
        { "<leader>c", ":Compile " },
        { "<leader>cc", ":Recompile<CR>" },
    },
    opts = {}, -- No configuration is available
}
```
