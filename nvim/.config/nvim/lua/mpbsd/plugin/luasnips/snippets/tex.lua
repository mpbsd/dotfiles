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
  -- upper case greek letter {{{
  -- lhs {{{
  upper_case_greek_letter = {
    lhs = {
      trig        = "([ABGDEZHJIKLMNXOPRSTUFQYW])`",
      dscr        = "upper case greek letter",
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
          A = "\\Alpha",
          B = "\\Beta",
          G = "\\Gamma",
          D = "\\Delta",
          E = "\\Epsilon",
          Z = "\\Zeta",
          H = "\\Eta",
          J = "\\Theta",
          I = "\\Iota",
          K = "\\Kappa",
          L = "\\Lambda",
          M = "\\Mu",
          N = "\\Nu",
          X = "\\Xi",
          O = "\\Omicron",
          P = "\\Pi",
          R = "\\Rho",
          S = "\\Sigma",
          T = "\\Tau",
          U = "\\Upsilon",
          F = "\\Phi",
          Q = "\\Chi",
          Y = "\\Psi",
          W = "\\Omega",
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
  s(M.upper_case_greek_letter.lhs, M.upper_case_greek_letter.rhs),
}
