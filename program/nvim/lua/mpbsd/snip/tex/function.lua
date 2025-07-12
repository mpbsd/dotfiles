local utils = require("mpbsd.core.snp")

return {
	-- function action {{{
	s(
		{
			trig = "fna",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "function action",
		},
		fmta(
			[[
	    {<>}\mapsto{<>}
	    ]],
			{ i(1, "x"), i(2, "f(x)") }
		),
		{ condition = utils.in_math }
	),
	-- }}}
	-- function definition {{{
	s(
		{
			trig = "fnd",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "function declaration",
		},
		fmta(
			[[
	    {<>}:{<>}\to{<>},\quad{{<>}\mapsto{<>}}
	    ]],
			{ i(1, "f"), i(2, "A"), i(3, "B"), i(4, "x"), i(5, "f(x)") }
		),
		{ condition = utils.in_math }
	),
	-- }}}
	-- function reference {{{
	s(
		{
			trig = "fnr",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "function reference",
		},
		fmta(
			[[
	    {<>}{\left(<>\right)}
	    ]],
			{ i(1, "f"), i(2, "x") }
		),
		{ condition = utils.in_math }
	),
	-- }}}
	-- trigonometric, exponential, logarithmic and hyperbolic functions {{{
	s(
		{
			trig = [[(?<=\\)(a?(cos|sin|tan|sec|csc|cot)h?|exp|log|ln)]],
			regTrig = true,
			trigEngine = "ecma",
			wordTrig = false,
			desc = "trigonometric, exponential, logarithmic and hyperbolic functions",
		},
		fmta(
			[[
	    <>{\left(<>\right)}
	    ]],
			{
				f(function(_, snip)
					local fn = {
						["cos"] = [[cos]],
						["sin"] = [[sin]],
						["tan"] = [[tan]],
						["acos"] = [[arccos]],
						["asin"] = [[arcsin]],
						["atan"] = [[arctan]],
						["sec"] = [[sec]],
						["csc"] = [[csc]],
						["cot"] = [[cot]],
						["asec"] = [[arcsec]],
						["acsc"] = [[arccsc]],
						["acot"] = [[arccot]],
						["cosh"] = [[cosh]],
						["sinh"] = [[sinh]],
						["tanh"] = [[tanh]],
						["acosh"] = [[arccosh]],
						["asinh"] = [[arcsinh]],
						["atanh"] = [[arctanh]],
						["sech"] = [[sech]],
						["csch"] = [[csch]],
						["coth"] = [[coth]],
						["asech"] = [[arcsech]],
						["acsch"] = [[arccsch]],
						["acoth"] = [[arccoth]],
						["exp"] = [[e^]],
						["log"] = [[log]],
						["ln"] = [[ln]],
					}
					return fn[snip.captures[1]]
				end),
				i(2, "x"),
			}
		),
		{ condition = utils.in_math }
	),
	-- }}}
}
