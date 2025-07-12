local utils = require("mpbsd.core.snp")

return {
	-- less than or equal to {{{
	s(
		{
			trig = "<=",
			snippetType = "autosnippet",
			desc = "less than or equal to",
		},
		fmta(
			[[
	    {<>}\leqslant{<>}
	    ]],
			{ i(1, "x"), i(2, "y") }
		),
		{ condition = utils.in_math }
	),
	-- }}}
	-- greater than or equal to {{{
	s(
		{
			trig = ">=",
			snippetType = "autosnippet",
			desc = "greater than or equal to",
		},
		fmta(
			[[
	    {<>}\geqslant{<>}
	    ]],
			{ i(1, "x"), i(2, "y") }
		),
		{ condition = utils.in_math }
	),
	-- }}}
	-- sum {{{
	s(
		{
			trig = "++",
			snippetType = "autosnippet",
			desc = "sum",
		},
		fmta(
			[[
	    \sum_{<>=<>}^{<>}<>
	    ]],
			{ i(1, "i"), i(2, "0"), i(3, "n-1"), i(4, "x_{i}") }
		),
		{ condition = utils.in_math }
	),
	-- }}}
	-- product {{{
	s(
		{
			trig = "**",
			snippetType = "autosnippet",
			desc = "product",
		},
		fmta(
			[[
	    \prod_{<>=<>}^{<>}<>
	    ]],
			{ i(1, "i"), i(2, "0"), i(3, "n-1"), i(4, "x_{i}") }
		),
		{ condition = utils.in_math }
	),
	-- }}}
	-- fraction {{{
	s(
		{
			trig = "//",
			snippetType = "autosnippet",
			desc = "fraction",
		},
		fmta(
			[[
	    \frac{<>}{<>}
	    ]],
			{ i(1, "x"), i(2, "y") }
		),
		{ condition = utils.in_math }
	),
	-- }}}
	-- su(b|per)script {{{
	s(
		{
			trig = [[([_^])\1]],
			regTrig = true,
			trigEngine = "ecma",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "su(b|per)script",
		},
		fmta(
			[[
	    <>{<>}
	    ]],
			{
				l(l.CAPTURE1, {}),
				i(1),
			}
		),
		{ condition = utils.in_math }
	),
	-- }}}
	-- inverse {{{
	s({
		trig = [[(?<=\^)-1]],
		regTrig = true,
		trigEngine = "ecma",
		snippetType = "autosnippet",
		desc = "inverse",
	}, t([[{-1}]]), { condition = utils.in_math }),
	-- }}}
	-- bar, dot, hat, overline and vector {{{
	s(
		{
			trig = [[(\S+)\.(bar|d{1,3}ot|hat|overline|vec)]],
			regTrig = true,
			trigEngine = "ecma",
			snippetType = "autosnippet",
			desc = "bar, dot, hat, overline and vector",
		},
		f(function(_, snip)
			return [[\]] .. snip.captures[2] .. [[{]] .. snip.captures[1] .. [[}]]
		end),
		{ condition = utils.in_math }
	),
	-- }}}
	-- absolute value, norm {{{
	s(
		{
			trig = [[(\S+)\.(abs|norm|order)]],
			regTrig = true,
			trigEngine = "ecma",
			snippetType = "autosnippet",
			desc = "absolute value, norm, order",
		},
		f(function(_, snip)
			return [[\]] .. snip.captures[2] .. [[{]] .. snip.captures[1] .. [[}]]
		end),
		{ condition = utils.in_math }
	),
	-- }}}
}
