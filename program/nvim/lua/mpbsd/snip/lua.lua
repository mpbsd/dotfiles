require("luasnip.session.snippet_collection").clear_snippets("lua")

return {
	s(
		{
			trig = "reg",
			snippetType = "autosnippet",
			desc = "snippet to create a snippet",
		},
		fmta(
			[[
      -- <> {{{
      s(
      {
        trig = "<>",
        regTrig = true,
        trigEngine = "ecma",
        wordTrig = false,
        snippetType = "<>",
        desc = "<>",
      }, <>,
      { condition = <> }
      ),
      -- }}}
      ]],
			{ rep(3), i(1, "trig"), i(2, "autosnippet"), i(3, "desc"), i(4), i(5) }
		),
		{ condition = conds.line_begin }
	),
}
