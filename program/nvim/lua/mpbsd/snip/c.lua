return {
	s({
		trig = "tern(ary|cond);",
		snippetType = "autosnippet",
		regTrig = true,
		trigEngine = "ecma",
		wordTrig = true,
		desc = "Ternary conditional",
	}, fmta([[(<>) ? <> : <>]], { i(1, "cond"), i(2, "then"), i(3, "false") })),
}
