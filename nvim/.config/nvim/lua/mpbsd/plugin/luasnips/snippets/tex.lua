local M = {
  -- lower case greek letter {{{
  lower_case_greek_letter = {
    lhs = {
      trig        = "([abgdezhjiklmnxprstufqyw])`",
      dscr        = "Lower case greek letters",
      regTrig     = true,
      wordTrig    = false,
      snippetType = "autosnippet",
    },
    rhs = f(
      function(_, snip)
        local alphabet = {
          a  = "\\alpha",
          b  = "\\beta",
          g  = "\\gamma",
          d  = "\\delta",
          e  = "\\epsilon",
          z  = "\\zeta",
          h  = "\\eta",
          j  = "\\theta",
          i  = "\\iota",
          k  = "\\kappa",
          l  = "\\lambda",
          m  = "\\mu",
          n  = "\\nu",
          x  = "\\xi",
          p  = "\\pi",
          r  = "\\rho",
          s  = "\\sigma",
          t  = "\\tau",
          u  = "\\upsilon",
          f  = "\\phi",
          q  = "\\chi",
          y  = "\\psi",
          w  = "\\omega",
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
      dscr        = "Upper case greek letters",
      regTrig     = true,
      wordTrig    = false,
      snippetType = "autosnippet",
    },
    rhs = f(
      function(_, snip)
        local alphabet = {
          G  = "\\Gamma",
          D  = "\\Delta",
          L  = "\\Lambda",
          F  = "\\Phi",
          P  = "\\Pi",
          Y  = "\\Psi",
          S  = "\\Sigma",
          J  = "\\Theta",
          U  = "\\Upsilon",
          X  = "\\Xi",
          W  = "\\Omega",
        }
        return alphabet[snip.captures[1]]
      end
    )
  },
  -- }}}
  -- upper case greek letter {{{
  variant_form_greek_letter = {
    lhs = {
      trig        = "(v[ekfprsj])`",
      dscr        = "Variant form greek letters",
      regTrig     = true,
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
  s(M.lower_case_greek_letter.lhs, M.lower_case_greek_letter.rhs),
  s(M.upper_case_greek_letter.lhs, M.upper_case_greek_letter.rhs),
  s(M.variant_form_greek_letter.lhs, M.variant_form_greek_letter.rhs),
}










