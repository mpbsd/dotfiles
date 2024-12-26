return {
	s(
		{
			trig = "afor",
			snippetType = "autosnippet",
			regTrig = false,
			wordTrig = false,
			desc = "for loop",
		},
		fmta(
			[[
        for(<>=<>; <><>; ++<>) {
          <>
        }<>
      ]],
			{ i(1), i(2), rep(1), i(3), rep(1), i(4), i(0) }
		)
	),
}
