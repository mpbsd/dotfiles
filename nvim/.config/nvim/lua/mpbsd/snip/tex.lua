local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
-- local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local extras = require("luasnip.extras")
-- local l = extras.lambda
-- local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require("luasnip.extras.expand_conditions")
-- local postfix = require("luasnip.extras.postfix").postfix
-- local types = require("luasnip.util.types")
-- local parse = require("luasnip.util.parser").parse_snippet
-- local ms = ls.multi_snippet
-- local k = require("luasnip.nodes.key_indexer").new_key

local snip = {
  -- inline_math_mode {{{
  inline_math_mode = {
    lhs = {
      trig        = ";im",
      dscr        = "inline math mode",
      regTrig     = true,
      wordTrig    = false,
      snippetType = "autosnippet",
    },
    rhs = fmta([[\(<>\)]], { i(1) })
  },
  -- }}}
  -- display_math_mode {{{
  display_math_mode = {
    lhs = {
      trig        = ";dm",
      dscr        = "display math mode",
      regTrig     = true,
      wordTrig    = false,
      snippetType = "autosnippet",
    },
    rhs = fmta(
      [[
      \[
        <>
      \]
      ]],
      { i(1) }
    )
  },
  -- }}}
}

return {
  s(snip.inline_math_mode.lhs, snip.inline_math_mode.rhs),
  s(snip.display_math_mode.lhs, snip.display_math_mode.rhs),
}
