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
  -- inline math mode {{{
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
  -- display math mode {{{
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
  -- lower case greek letter {{{
  lower_case_greek_letter = {
    lhs = {
      trig        = "([abgdezhjiklmnxprstufqyw])`",
      dscr        = "lower case greek letter",
      regTrig     = false,
      wordTrig    = false,
      snippetType = "autosnippet",
    },
    rhs = f(
      function(_, snip)
        local alphabet = {
          a = "\\alpha",
          b = "\\beta",
          g = "\\gamma",
          d = "\\delta",
          e = "\\epsilon",
          z = "\\zeta",
          h = "\\eta",
          j = "\\theta",
          i = "\\iota",
          k = "\\kappa",
          l = "\\lambda",
          m = "\\mu",
          n = "\\nu",
          x = "\\xi",
          p = "\\pi",
          r = "\\rho",
          s = "\\sigma",
          t = "\\tau",
          u = "\\upsilon",
          f = "\\phi",
          q = "\\chi",
          y = "\\psi",
          w = "\\omega",
        }
        return alphabet[snip.captures[1]]
      end
    )
  },
  -- }}}
  -- upper case greek letter {{{
  upper_case_greek_letter = {
    lhs = {
      trig        = "([GDLFPYSJUXW])`",
      dscr        = "upper case greek letter",
      regTrig     = false,
      wordTrig    = false,
      snippetType = "autosnippet",
    },
    rhs = f(
      function(_, snip)
        local alphabet = {
          G = "\\Gamma",
          D = "\\Delta",
          L = "\\Lambda",
          F = "\\Phi",
          P = "\\Pi",
          S = "\\Sigma",
          J = "\\Theta",
          U = "\\Upsilon",
          X = "\\Xi",
          W = "\\Omega",
        }
        return alphabet[snip.captures[1]]
      end
    )
  },
  -- }}}
  -- variant font greek letter {{{
  variant_font_greek_letter = {
    lhs = {
      trig        = "(v[ekfprs])`",
      dscr        = "variant font greek letter",
      regTrig     = false,
      wordTrig    = false,
      snippetType = "autosnippet",
    },
    rhs = f(
      function(_, snip)
        local alphabet = {
          ve = "\\varepsilon",
          vk = "\\varkappa",
          vf = "\\varphi",
          vp = "\\varpi",
          vr = "\\varrho",
          vs = "\\varsigma",
          vj = "\\vartheta",
        }
        return alphabet[snip.captures[1]]
      end
    )
  },
  -- }}}
}

return {
  s(snip.inline_math_mode.lhs, snip.inline_math_mode.rhs),
  s(snip.display_math_mode.lhs, snip.display_math_mode.rhs),
  s(snip.upper_case_greek_letter.lhs, snip.upper_case_greek_letter.rhs),
  s(snip.lower_case_greek_letter.lhs, snip.lower_case_greek_letter.rhs),
  s(snip.variant_font_greek_letter.lhs, snip.variant_font_greek_letter.rhs),
}
