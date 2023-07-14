local get_either_capture_group_or_visual_selection = function(_, parent)
  if (#parent.snippet.captures[1] > 0) then
    return sn(nil, i(1, parent.snippet.captures[1]))
  elseif (#parent.snippet.env.SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1))
  end
end

local inline_math_mode = {
  context = {
    trig        = "mi;([^;]*);",
    dscr        = "Math Mode",
    regTrig     = true,
    wordTrig    = true,
    snippetType = "autosnippet",
  },
  snippet = fmta([[\(<>\)]], d(1, get_either_capture_group_or_visual_selection))
}

local display_math_mode = {
  context = {
    trig        = "md;([^;]*);",
    dscr        = "Math Mode",
    regTrig     = true,
    wordTrig    = true,
    snippetType = "autosnippet",
  },
  snippet = fmta(
    [[
    \[
      <>
    \]
    ]], d(1, get_either_capture_group_or_visual_selection)
  )
}

local greek_letter_1 = {
  context = {
    trig        = "([AaBbGgDdEeZzHhJjIiKkLlMmNnXxOοPpRrSsTtUuFfQqYyWw])`",
    dscr        = "Greek letters -- part 1",
    regTrig     = true,
    wordTrig    = false,
    snippetType = "autosnippet",
  },
  snippet = f(function(_, snip)
    local greek_alphabet_p1 = {
      A = "\\Alpha",
      a = "\\alpha",
      B = "\\Beta",
      b = "\\beta",
      G = "\\Gamma",
      g = "\\gamma",
      D = "\\Delta",
      d = "\\delta",
      E = "\\Epsilon",
      e = "\\epsilon",
      Z = "\\Zeta",
      z = "\\zeta",
      H = "\\Eta",
      h = "\\eta",
      J = "\\Theta",
      j = "\\theta",
      I = "\\Iota",
      i = "\\iota",
      K = "\\Kappa",
      k = "\\kappa",
      L = "\\Lambda",
      l = "\\lambda",
      M = "\\Mu",
      m = "\\mu",
      N = "\\Nu",
      n = "\\nu",
      X = "\\Xi",
      x = "\\xi",
      O = "\\Omicron",
      o = "\\omicron",
      P = "\\Pi",
      p = "\\pi",
      R = "\\Rho",
      r = "\\rho",
      S = "\\Sigma",
      s = "\\sigma",
      T = "\\Tau",
      t = "\\tau",
      U = "\\Upsilon",
      u = "\\upsilon",
      F = "\\Phi",
      f = "\\phi",
      Q = "\\Chi",
      q = "\\chi",
      Y = "\\Psi",
      y = "\\psi",
      W = "\\Omega",
      w = "\\omega",
    }
    return greek_alphabet_p1[snip.captures[1]]
  end),
}

local greek_letter_2 = {
  context = {
    trig        = "(d[Gg])`",
    dscr        = "Greek letters -- part 2",
    regTrig     = true,
    wordTrig    = false,
    snippetType = "autosnippet",
  },
  snippet = f(function(_, snip)
    local greek_alphabet_p2 = {
      dG = "\\Digamma",
      dg = "\\digamma",
    }
    return greek_alphabet_p2[snip.captures[1]]
  end),
}

local greek_letter_3 = {
  context = {
    trig        = "(v[sbejkprfJ])`",
    dscr        = "Greek letters -- part 3",
    regTrig     = true,
    wordTrig    = false,
    snippetType = "autosnippet",
  },
  snippet = f(function(_, snip)
    local greek_alphabet_p3 = {
      vs = "\\varsigma",
      vb = "\\varbeta",
      ve = "\\varepsilon",
      vj = "\\vartheta",
      vk = "\\varkappa",
      vp = "\\varpi",
      vr = "\\varrho",
      vf = "\\varphi",
      vJ = "\\varTheta",
    }
    return greek_alphabet_p3[snip.captures[1]]
  end),
}

local fraction = {
  context = {
    trig        = "f;([^;]*);([^;]*);",
    dscr        = "Fractions",
    regTrig     = true,
    wordTrig    = false,
    snippetType = "autosnippet",
  },
  snippet = fmta(
    [[\frac{<>}{<>}]], {
      f(function(_, snip) return snip.captures[1] end),
      f(function(_, snip) return snip.captures[2] end)
    }
  ),
}

return {
  s(inline_math_mode.context, inline_math_mode.snippet),
  s(display_math_mode.context, display_math_mode.snippet),
  s(greek_letter_1.context, greek_letter_1.snippet),
  s(greek_letter_2.context, greek_letter_2.snippet),
  s(greek_letter_3.context, greek_letter_3.snippet),
  s(fraction.context, fraction.snippet),
}
