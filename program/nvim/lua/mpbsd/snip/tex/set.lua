local utils = require("mpbsd.core.snp")

return {
	s(
		{
			trig = [[;fa]],
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "for all",
		},
		fmta(
			[[
	    \forall\,{<>}\in{<>}
	    ]],
			{ i(1, "x"), i(2, "A") }
		),
		{ condition = utils.in_math }
	),
	s(
		{
			trig = [[;te]],
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "there exists",
		},
		fmta(
			[[
	    \exists\,{<>}\in{<>}
	    ]],
			{ i(1, "x"), i(2, "A") }
		),
		{ condition = utils.in_math }
	),
	s(
		{
			trig = [[;ee]],
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "belongs to",
		},
		fmta(
			[[
	    {<>}\in{<>}
	    ]],
			{ i(1, "x"), i(2, "A") }
		),
		{ condition = utils.in_math }
	),
	s(
		{
			trig = [[;EE]],
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "owns",
		},
		fmta(
			[[
	    {<>}\owns{<>}
	    ]],
			{ i(1, "A"), i(2, "x") }
		),
		{ condition = utils.in_math }
	),
	s(
		{
			trig = [[;cc]],
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "subset",
		},
		fmta(
			[[
	    {<>}\subset{<>}
	    ]],
			{ i(1, "A"), i(2, "B") }
		),
		{ condition = utils.in_math }
	),
	s(
		{
			trig = [[;CC]],
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "subset",
		},
		fmta(
			[[
	    {<>}\supset{<>}
	    ]],
			{ i(1, "A"), i(2, "B") }
		),
		{ condition = utils.in_math }
	),
	s(
		{
			trig = [[;uu]],
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "cup",
		},
		fmta(
			[[
	    {<>}\cup{<>}
	    ]],
			{ i(1, "A"), i(2, "B") }
		),
		{ condition = utils.in_math }
	),
	s(
		{
			trig = [[;UU]],
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "bigcup",
		},
		fmta(
			[[
	    \bigcup_{<>}<>
	    ]],
			{ i(1, [[i\in{I}]]), i(2, [[U_{i}]]) }
		),
		{ condition = utils.in_math }
	),
	s(
		{
			trig = [[;nn]],
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "cap",
		},
		fmta(
			[[
	    {<>}\cap{<>}
	    ]],
			{ i(1, "A"), i(2, "B") }
		),
		{ condition = utils.in_math }
	),
	s(
		{
			trig = [[;NN]],
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "bigcap",
		},
		fmta(
			[[
	    \bigcap_{<>}<>
			]],
			{ i(1, [[i\in{I}]]), i(2, [[U_{i}]]) }
		),
		{ condition = utils.in_math }
	),
	s(
		{
			trig = [[;xx]],
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "times",
		},
		fmta(
			[[
	    {<>}\times{<>}
	    ]],
			{ i(1, "A"), i(2, "B") }
		),
		{ condition = utils.in_math }
	),
	s(
		{
			trig = [[;XX]],
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "cartesian product",
		},
		fmta(
			[[
	    \prod_{<>}<>
	    ]],
			{ i(1, [[i\in{I}]]), i(2, [[U_{i}]]) }
		),
		{ condition = utils.in_math }
	),
	s(
		{
			trig = [[;ac]],
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "absolute complement",
		},
		fmta(
			[[
	    {<>}\setminus{<>}
	    ]],
			{ i(1, "A"), i(2, "B") }
		),
		{ condition = utils.in_math }
	),
	s({
		trig = [[;rc]],
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "relative complement",
	}, t([[^{c}]]), { condition = utils.in_math }),
	s({
		trig = [[;OO]],
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "empty set",
	}, t([[\emptyset]]), { condition = utils.in_math }),
	s(
		{
			trig = [[(?<=\\)([nzqrc])\1]],
			regTrig = true,
			trigEngine = "ecma",
			snippetType = "autosnippet",
			desc = "numerical sets",
		},
		f(function(_, snip)
			local M = {
				["n"] = [[mathbb{N}]],
				["z"] = [[mathbb{Z}]],
				["q"] = [[mathbb{Q}]],
				["r"] = [[mathbb{R}]],
				["c"] = [[mathbb{C}]],
			}
			return M[snip.captures[1]]
		end),
		{ condition = utils.in_math }
	),
}
