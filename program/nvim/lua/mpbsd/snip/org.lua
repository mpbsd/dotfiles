require("luasnip.session.snippet_collection").clear_snippets("org")

return {
	-- begin an emacs-lisp source code block {{{
	s(
		{
			trig = [[^\s*;elisp]],
			regTrig = true,
			docTrig = [[\s*;elisp]],
			trigEngine = "ecma",
			snippetType = "autosnippet",
			desc = "begin an emacs-lisp source code block",
		},
		fmta(
			[[
      #+begin_src emacs-lisp
        <>
      #+end_src
      <>
			]],
			{
				i(1),
				i(0),
			}
		),
		{}
	),
	-- }}}
}
