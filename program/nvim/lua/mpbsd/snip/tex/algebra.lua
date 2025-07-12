local utils = require("mpbsd.core.glb").utils

return {
	-- custom commands for group theory {{{
	s(
		{
			trig = "_group",
			snippetType = "autosnippet",
			desc = "custom commands for group theory",
		},
		t({
			[[\DeclarePairedDelimiter{\order}{\lvert}{\rvert}]],
			[[\newcommand{\subgroup}{\leqslant}]],
			[[\newcommand{\normalsubgroup}{\trianglelefteqslant}]],
		}),
		{ condition = conds.line_begin }
	),
	-- }}}
	-- subgroup {{{
	s(
		{
			trig = ";sg",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "subgroup",
		},
		fmta(
			[[
      {<>}\subgroup{<>}
      ]],
			{ i(1, "H"), i(2, "G") }
		),
		{ condition = conds.in_math }
	),
	-- }}}
	-- normal subgroup {{{
	s(
		{
			trig = ";ns",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "normal subgroup",
		},
		fmta(
			[[
      {<>}\normalsubgroup{<>}
      ]],
			{ i(1, "N"), i(2, "G") }
		),
		{ condition = conds.in_math }
	),
	-- }}}
	-- lagrange's theorem {{{
	s(
		{
			trig = ";lt",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "lagrange's theorem",
		},
		fmta(
			[[
      \order{<>}=\left[<>:<>\right]\order{<>}
      ]],
			{ i(1, "G"), rep(1), i(2, "H"), rep(2) }
		),
		{ condition = conds.in_math }
	),
	-- }}}
	-- galois group {{{
	s(
		{
			trig = [[gg([a-z])([a-z])]],
			regTrig = true,
			trigEngine = "ecma",
			snippetType = "autosnippet",
			desc = "galois group",
		},
		f(function(_, snip)
			local K = snip.captures[1]:upper()
			local F = snip.captures[2]:upper()
			if snip.captures[2]:match("[qrc]") then
				F = [[\mathbb{]] .. snip.captures[2]:upper() .. [[}]]
			end
			return "G(" .. K .. "," .. F .. ")"
		end),
		{ condition = utils.in_math }
	),
	-- }}}
	-- polynomial rings {{{
	s(
		{
			trig = [[(?<=\\)([zqrc])([xt])]],
			regTrig = true,
			trigEngine = "ecma",
			snippetType = "autosnippet",
			desc = "polynomial rings",
		},
		f(function(_, snip)
			local M = {
				["z"] = [[mathbb{Z}]],
				["q"] = [[mathbb{Q}]],
				["r"] = [[mathbb{R}]],
				["c"] = [[mathbb{C}]],
			}
			return M[snip.captures[1]] .. "[" .. snip.captures[2] .. "]"
		end),
		{ condition = utils.in_math }
	),
	-- }}}
}
