local M = {
  -- lower case greek letter {{{
  -- lhs {{{
  lower_case_greek_letter = {
    lhs = {
      trig        = "([abgdezhjiklmnxoprstufqyw])`",
      dscr        = "Lower case greek letter",
      regTrig     = true,
      wordTrig    = false,
      snippetType = "autosnippet",
    },
    -- }}}
    -- rhs {{{
    rhs = {
      f(function(_, snip)
        -- alphabet {{{
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
          o = "\\omicron",
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
        -- }}}
        return alphabet[snip.captures[1]]
      end
      )
    }
    -- }}}
  },
  -- }}}
}

return {
  s(M.lower_case_greek_letter.lhs, M.lower_case_greek_letter.rhs),
}
