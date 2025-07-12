local utils = require("mpbsd.core.glb").utils

return {
	-- inline math mode {{{
	s(
		{
			trig = "((",
			snippetType = "autosnippet",
			desc = "inline math mode",
		},
		fmta(
			[[
        \(<>\)
      ]],
			{ i(1) }
		),
		{ condition = utils.in_text }
	),
	-- }}}
	-- display math mode {{{
	s(
		{
			trig = "[[",
			snippetType = "autosnippet",
			desc = "display math mode",
		},
		fmta(
			[[
      \[
        <>
      \]
      ]],
			{ i(1) }
		),
		{ condition = utils.in_text }
	),
	-- }}}
}
