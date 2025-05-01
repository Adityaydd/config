return {
  'L3MON4D3/LuaSnip',
  dependencies = { 'rafamadriz/friendly-snippets' },
  config = function()
    local luasnip = require 'luasnip'

    -- Load VSCode-style snippets
    require('luasnip.loaders.from_vscode').lazy_load()

    -- Extend HTML filetype (optional but useful)
    luasnip.filetype_extend('html', { 'html' })
    luasnip.filetype_extend('python', { 'python' })

    -- Load custom Lua snippets from ~/.config/nvim/lua/snippets/
    require('luasnip.loaders.from_lua').load { paths = '~/.config/nvim/lua/snippets/' }
  end,
}
