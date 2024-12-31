return {
	s(
		{
			trig = "^main",
			snippetType = "autosnippet",
			regTrig = true,
			trigEngine = "ecma",
			wordTrig = true,
			desc = "A Skeleton for a C program",
		},
		fmta(
			[[
      <>

      int main(<>) {
        <>
        exit(EXIT_SUCCESS);
      }
      ]],
			{ t({ "#include <stdio.h>", "#include <stdlib.h>" }), i(1, "void"), i(0) }
		)
	),
	s({
		trig = "3naryc",
		snippetType = "autosnippet",
		regTrig = true,
		trigEngine = "ecma",
		wordTrig = true,
		desc = "Ternary conditional",
	}, fmta([[(<>) ? <> : <>;]], { i(1, "cond"), i(2, "then"), i(3, "false") })),
}
