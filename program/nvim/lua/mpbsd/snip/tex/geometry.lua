local utils = require("mpbsd.core.glb").utils

return {
	-- custom commands for differential geometry {{{
	s(
		{
			trig = "_dgeom",
			snippetType = "autosnippet",
			desc = "custom commands for differential geometry",
		},
		t({
			[[\newcommand{\X}[1]{\partial_{#1}}]],
			[[\newcommand{\flatMetr}[2]{g{\left({#1},{#2}\right)}}]],
			[[\newcommand{\flatConn}[2]{\nabla_{#1}{#2}}]],
			[[\newcommand{\riemMetr}[2]{\bar{g}{\left({#1},{#2}\right)}}]],
			[[\newcommand{\riemConn}[2]{\bar{\nabla}_{#1}{#2}}]],
			[[\newcommand{\curvTens}[2]{\bar{R}m\left({#1},{#2}\right)}]],
			[[\newcommand{\riccTens}[2]{\bar{R}c\left({#1},{#2}\right)}]],
		}),
		{ condition = conds.line_begin }
	),
	-- }}}
	-- n-dimensional differentiable manifold {{{
	s({
		trig = "Mn",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "n-dimensional differentiable manifold",
	}, { t("M^{n}") }, { condition = utils.in_math }),
	-- }}}
	-- n-dimensional, simply connected riemannian space forms {{{
	s(
		{
			trig = [[(?<=\\)([ehs])\1]],
			regTrig = true,
			trigEngine = "ecma",
			snippetType = "autosnippet",
			desc = "n-dimensional, simply connected Riemannian space forms",
		},
		f(function(_, snip)
			local M = {
				["e"] = [[mathbb{E}]],
				["h"] = [[mathbb{H}]],
				["s"] = [[mathbb{S}]],
			}
			return M[snip.captures[1]] .. [[^{n}]]
		end),
		{ condition = utils.in_math }
	),
	-- }}}
	-- n-dimensional riemannian manifold {{{
	s({
		trig = "mnf",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "n-dimensional riemannian manifold",
	}, t([[\left(M^{n},g\right)]]), { condition = utils.in_math }),
	-- }}}
	-- n-dimensional riemannian manifold {{{
	s({
		trig = "mng",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "n-dimensional riemannian manifold",
	}, t([[\left(M^{n},\bar{g}\right)]]), { condition = utils.in_math }),
	-- }}}
	-- algebra of smooth functions {{{
	s(
		{
			trig = "asf",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "algebra of smooth functions",
		},
		fmta(
			[[
	    C^{\infty}{\left(<>\right)}
	    ]],
			{ i(1, [[M^{n}]]) }
		),
		{ condition = utils.in_math }
	),
	-- }}}
	-- module of smooth vector fields {{{
	s(
		{
			trig = "mvf",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "module of smooth vector fields",
		},
		fmta(
			[[
	    \mathfrak{X}^{\infty}{\left(<>\right)}
	    ]],
			{ i(1, [[M^{n}]]) }
		),
		{ condition = utils.in_math }
	),
	-- }}}
	-- \partial_{} {{{
	s(
		{
			trig = "6x([ijkl])",
			regTrig = true,
			trigEngine = "ecma",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = [[\partial_{}]],
		},
		fmta(
			[[
	    \X{<>}
	    ]],
			{ l(l.CAPTURE1, {}) }
		),
		{ condition = utils.in_math }
	),
	-- }}}
	-- dx_{} {{{
	s(
		{
			trig = "dx([ijkl])",
			regTrig = true,
			trigEngine = "ecma",
			snippetType = "autosnippet",
			desc = [[dx^{}]],
		},
		fmta(
			[[
	    dx^{<>}
	    ]],
			{ l(l.CAPTURE1, {}) }
		),
		{ condition = utils.in_math }
	),
	-- }}}
	-- nabla 1 {{{
	s({
		trig = "nb1",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = [[\nabla]],
	}, t([[\nabla]]), { condition = utils.in_math }),
	-- }}}
	-- nabla 2 {{{
	s({
		trig = "nb2",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = [[\nabla^{2}]],
	}, t([[\nabla^{2}]]), { condition = utils.in_math }),
	-- }}}
	-- (flat) riemannian metric {{{
	s(
		{
			trig = "frm",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "(flat) riemannian metric",
		},
		fmta(
			[[
	    \flatMetr{<>}{<>}
	    ]],
			{ i(1, "X"), i(2, "Y") }
		),
		{ condition = utils.in_math }
	),
	-- }}}
	-- (flat) riemannian connection {{{
	s(
		{
			trig = "flc",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "(flat) riemannian connection",
		},
		fmta(
			[[
	    \flatConn{<>}{<>}
	    ]],
			{ i(1, "X"), i(2, "Y") }
		),
		{ condition = utils.in_math }
	),
	-- }}}
	-- riemannian metric {{{
	s(
		{
			trig = "grm",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "riemannian metric",
		},
		fmta(
			[[
	    \riemMetr{<>}{<>}
	    ]],
			{ i(1, "X"), i(2, "Y") }
		),
		{ condition = utils.in_math }
	),
	-- }}}
	-- riemannian connection {{{
	s(
		{
			trig = "glc",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "riemannian connection",
		},
		fmta(
			[[
	    \riemConn{<>}{<>}
	    ]],
			{ i(1, "X"), i(2, "Y") }
		),
		{ condition = utils.in_math }
	),
	-- }}}
	-- modeling factor {{{
	s({
		trig = "d0mf",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "modeling factor",
	}, t([[\mathcal{G}_{0}]]), { condition = utils.in_math }),
	-- }}}
	-- first covariant derivative of the modeling factor {{{
	s({
		trig = "d1mf",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "first covariant derivative of the modeling factor",
	}, t([[\mathcal{G}_{1}]]), { condition = utils.in_math }),
	-- }}}
	-- second covariant derivative of the modeling factor {{{
	s({
		trig = "d2mf",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "second covariant derivative of the modeling factor",
	}, t([[\mathcal{G}_{2}]]), { condition = utils.in_math }),
	-- }}}
}
