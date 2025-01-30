require("luasnip.session.snippet_collection").clear_snippets("c")

return {
	-- ternary operator {{{
	s({
		trig = "??",
		snippetType = "autosnippet",
		desc = "ternary operator",
	}, fmta([[(<>) ? <> : <>;]], { i(1), i(2), i(3) })),
	-- }}}
}
