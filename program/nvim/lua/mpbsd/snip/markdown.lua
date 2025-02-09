require("luasnip.session.snippet_collection").clear_snippets("markdown")

return {
	s(
		{
			trig = "_sh",
			snippetType = "autosnippet",
			desc = "shell script",
		},
		fmta(
			[[
      ```shell
      $ <>
      ```
      ]],
			i(1)
		)
	),
}
