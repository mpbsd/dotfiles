return {
  "L3MON4D3/LuaSnip",
  version = "v1.1.0",
  config = function()
    local ls = require("luasnip")
    -- local s = ls.snippet
    -- local sn = ls.snippet_node
    -- local isn = ls.indent_snippet_node
    -- local t = ls.text_node
    -- local i = ls.insert_node
    -- local f = ls.function_node
    -- local c = ls.choice_node
    -- local d = ls.dynamic_node
    -- local r = ls.restore_node
    -- local events = require("luasnip.util.events")
    -- local ai = require("luasnip.nodes.absolute_indexer")
    -- local fmt = require("luasnip.extras.fmt").fmt
    -- local fmta = require("luasnip.extras.fmt").fmta
    -- local extras = require("luasnip.extras")
    -- local m = extras.m
    -- local l = extras.l
    -- local rep = extras.rep
    -- local postfix = require("luasnip.extras.postfix").postfix
    ls.config.setup({
      enable_autosnippets  = true,
      history              = true,
      store_selection_keys = "<Tab>",
      updateevents         = "TextChanged,TextChangedI",
    })
    require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/mpbsd/luasnip/" })
    vim.keymap.set({ "i", "s" }, "<Tab>", function() if ls.expandable() then ls.expand() end end,
      { noremap = true, silent = true })
    vim.keymap.set({ "i", "s" }, "<C-j>", function() if ls.jumpable(1) then ls.jump(1) end end,
      { noremap = true, silent = true })
    vim.keymap.set({ "i", "s" }, "<C-k>", function() if ls.jumpable(-1) then ls.jump(-1) end end,
      { noremap = true, silent = true })
    -- vim.keymap.set({ "i", "s" }, "<C-n>", "<Plug>luasnip-next-choice", { noremap=true, silent=true })
    -- vim.keymap.set({ "i", "s" }, "<C-p>", "<Plug>luasnip-prev-choice", { noremap=true, silent=true })
  end
}
