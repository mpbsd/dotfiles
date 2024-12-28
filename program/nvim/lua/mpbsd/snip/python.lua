return {
	s({
		trig = "^from",
		snippetType = "autosnippet",
		regTrig = true,
		wordTrig = false,
		desc = "from imports",
	}, fmta([[from <> import <>]], { i(1), i(2) })),
	s({
		trig = "__",
		snippetType = "autosnippet",
		regTrig = false,
		wordTrig = false,
		desc = "",
	}, fmta("__<>__", { i(1) })),
}
