return {
	-- LaTeX notes metadata {{{
	s(
		{
			trig = "meta",
			snippetType = "autosnippet",
			desc = "LaTeX notes metadata",
		},
		fmta(
			[[
      {
        "metadata": {
          "topic": "<>",
          "date": "<>"
        },
        "reference": {
          "title": "<>",
          "author": "<>",
          "key": "<>"
        }
      }
      ]],
			{
				i(1, "topic"),
				p(os.date, "%Y-%m-%d"),
				i(2, "title"),
				i(3, "author"),
				i(4, "reference"),
			},
			{ condition = conds.line_begin }
		)
	),
	-- }}}
}
