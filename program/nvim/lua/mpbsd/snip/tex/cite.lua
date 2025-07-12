local utils = require("mpbsd.core.glb").utils

return {
	s(
		{
			trig = [[\cite]],
			snippetType = "autosnippet",
			desc = "cite",
		},
		fmta(
			[[
      ~\cite{<>}<>
      ]],
			{ i(1), i(0) }
		),
		{ condition = utils.in_text }
	),
}
