-- function: greek_letter {{{ 1
local greek_letter = function(_, snip)
	-- lower case {{{ 2
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
	-- upper case {{{ 2
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
	-- variant {{{ 2
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
end
-- }}}

return {
	s({
		trig = "`([luv])([a-z])",
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
