return {
  "L3MON4D3/LuaSnip",
  version = "2.*",
  build = "make install_jsregexp",
  config = function()
    local ls = require("luasnip")
    local vim_keymap_set = require("mpbsd.core.opts.globals").vim_keymap_set
    local snippets_dir = "~/.config/nvim/lua/mpbsd/snip/"
    ls.setup({
      enable_autosnippets  = true,
      history              = true,
      store_selection_keys = "<tab>",
      updateevents         = "TextChanged,TextChangedI",
    })
    require("luasnip.loaders.from_lua").load({ paths = snippets_dir })
    vim_keymap_set({
      {
        mod = "i",
        lhs = "<tab>",
        rhs = function()
          ls.expand()
        end,
        opt = {
          desc = "Snippets' trigger",
        }
      },
      {
        mod = { "i", "s" },
        lhs = "<c-j>",
        rhs = function() ls.jump(1) end,
        opt = {
          desc = "Jump to the next node",
        }
      },
      {
        mod = { "i", "s" },
        lhs = "<c-k>",
        rhs = function() ls.jump(-1) end,
        opt = {
          desc = "Jump to the previous node",
        }
      }
    })
  end
}
