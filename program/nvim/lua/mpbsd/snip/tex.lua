-- function: greek_letter {{{ 1
local greek_letter = function(_, snip)
	-- alphabet {{{ 2
	local alphabet = {
		a = [[\alpha]],
		b = [[\beta]],
		g = [[\gamma]],
		d = [[\delta]],
		e = [[\epsilon]],
		z = [[\zeta]],
		h = [[\eta]],
		j = [[\theta]],
		i = [[\iota]],
		k = [[\kappa]],
		l = [[\lambda]],
		m = [[\mu]],
		n = [[\nu]],
		x = [[\xi]],
		p = [[\pi]],
		r = [[\rho]],
		s = [[\sigma]],
		t = [[\tau]],
		u = [[\upsilon]],
		f = [[\phi]],
		c = [[\chi]],
		y = [[\psi]],
		w = [[\omega]],
		G = [[\Gamma]],
		D = [[\Delta]],
		J = [[\Theta]],
		L = [[\Lambda]],
		X = [[\Xi]],
		P = [[\Pi]],
		S = [[\Sigma]],
		U = [[\Upsilon]],
		F = [[\Phi]],
		Y = [[\Psi]],
		W = [[\Omega]],
		ve = [[\varepsilon]],
		vj = [[\vartheta]],
		vp = [[\varpi]],
		vs = [[\varsigma]],
		vr = [[\varrho]],
		vf = [[\varphi]],
	}
	-- }}}
	if alphabet[snip.captures[1]] ~= nil then
		return alphabet[snip.captures[1]]
	end
end
-- }}}

return {
	s({
		trig = "`([abgdezhjiklmnxprstufcyw]|[GDJLXPSUFYW]|v[ejpsrf])",
		regTrig = true,
		trigEngine = "ecma",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "Greek Letters",
	}, f(greek_letter, {})),
	s(
		{
			trig = "\\[{2}",
			regTrig = true,
			trigEngine = "ecma",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "Display Math Mode",
		},
		fmta(
			[[
      \[
        <>
      \]
      ]],
			{ i(1) }
		)
	),
}
