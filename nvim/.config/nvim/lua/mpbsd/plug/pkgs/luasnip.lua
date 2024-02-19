return {
  'L3MON4D3/LuaSnip',
  version = '2.*',
  build = 'make install_jsregexp',
  config = function()
    local luasnip = require('luasnip')
    local luasnip_loaders_from_lua = require('luasnip.loaders.from_lua')
    local globals = require('mpbsd.core.opts.globals')
    luasnip.setup({
      -- settings {{{
      enable_autosnippets  = true,
      history              = true,
      store_selection_keys = '<tab>',
      updateevents         = 'TextChanged,TextChangedI',
      -- }}}
    })
    luasnip_loaders_from_lua.load({
      paths = '~/.config/nvim/lua/mpbsd/snip/'
    })
    globals.vim_keymap_set({
      -- keymaps {{{
      {
        mod = 'i',
        lhs = '<tab>',
        rhs = function() luasnip.expand() end,
        opt = {
          noremap = true,
          silent = true,
          desc = 'Trigger snippets',
        }
      },
      {
        mod = { 'i', 's' },
        lhs = '<c-j>',
        rhs = function() luasnip.jump(1) end,
        opt = {
          noremap = true,
          silent = true,
          desc = 'Jump to the next node',
        }
      },
      {
        mod = { 'i', 's' },
        lhs = '<c-k>',
        rhs = function() luasnip.jump(-1) end,
        opt = {
          noremap = true,
          silent = true,
          desc = 'Jump to the previous node',
        }
      }
      -- }}}
    })
  end
}
