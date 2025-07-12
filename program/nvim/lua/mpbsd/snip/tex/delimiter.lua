local utils = require("mpbsd.core.snp")

return {
	-- delimiters {{{
	s(
		{
			trig = [[(d)([pPbBcCg])]],
			regTrig = true,
			trigEngine = "ecma",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "delimiters",
		},
		fmta(
			[[
	    <><><>
			]],
			{
				f(utils.delimiter, {}, { user_args = { "lhs" } }),
				i(1),
				f(utils.delimiter, {}, { user_args = { "rhs" } }),
			}
		),
		{ condition = utils.in_math }
	),
	-- }}}
}
