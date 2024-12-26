return {
	s(
		{
			trig = ";([luv])([a-z])",
			snippetType = "autosnippet",
			regTrig = true,
			wordTrig = false,
			desc = "Greek letters",
		},
		f(function(_, snip)
			-- lower case {{{
			local lower_case = {
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
			}
			-- }}}
			-- upper case {{{
			local upper_case = {
				g = [[\Gamma]],
				d = [[\Delta]],
				j = [[\Theta]],
				l = [[\Lambda]],
				x = [[\Xi]],
				p = [[\Pi]],
				s = [[\Sigma]],
				u = [[\Upsilon]],
				f = [[\Phi]],
				y = [[\Psi]],
				w = [[\Omega]],
			}
			-- }}}
			-- variant {{{
			local variant = {
				e = [[\varepsilon]],
				j = [[\vartheta]],
				p = [[\varpi]],
				s = [[\varsigma]],
				r = [[\varrho]],
				f = [[\varphi]],
			}
			-- }}}
			if snip.captures[1] == "l" then
				if lower_case[snip.captures[2]] ~= nil then
					return lower_case[snip.captures[2]]
				end
			elseif snip.captures[1] == "u" then
				if upper_case[snip.captures[2]] ~= nil then
					return upper_case[snip.captures[2]]
				end
			elseif snip.captures[1] == "v" then
				if variant[snip.captures[2]] ~= nil then
					return variant[snip.captures[2]]
				end
			end
		end, {})
	),
	s({
		trig = ";im",
		snippetType = "autosnippet",
		regTrig = false,
		wordTrig = false,
		desc = "Inline math mode",
	}, fmta([[$<>$]], { i(1) })),
	s(
		{
			trig = ";dm",
			snippetType = "autosnippet",
			regTrig = false,
			wordTrig = false,
			desc = "Display math mode",
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
	s({
		trig = "`/",
		snippetType = "autosnippet",
		regTrig = false,
		wordTrig = false,
		desc = "Fraction",
	}, fmta([[\frac{<>}{<>}]], { i(1), i(2) })),
	s({
		trig = "__",
		snippetType = "autosnippet",
		regTrig = false,
		wordTrig = false,
		desc = "Subscript",
	}, fmta([[_{<>}]], { i(1) })),
	s({
		trig = "[%^][%^]",
		snippetType = "autosnippet",
		regTrig = false,
		wordTrig = false,
		desc = "Superscript",
	}, fmta([[^{<>}]], { i(1) })),
	s(
		{
			trig = "^beg",
			snippetType = "autosnippet",
			regTrig = true,
			wordTrig = false,
			desc = "Enviroment",
		},
		fmta(
			[[
      \begin{<>}
        <>
      \end{<>}
      ]],
			{ i(1), i(2), rep(1) }
		)
	),
}
