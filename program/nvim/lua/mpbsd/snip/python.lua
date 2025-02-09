require("luasnip.session.snippet_collection").clear_snippets("python")

return {
	-- #!/usr/bin/env python3 {{{
	s({
		trig = "#!",
		snippetType = "autosnippet",
		desc = "#!/usr/bin/env python3",
	}, {
		t([[#!/usr/bin/env python3]]),
		t(""),
	}, { condition = conds.line_begin }),
	-- }}}
	-- import <> {{{
	s({
		trig = "_im",
		snippetType = "autosnippet",
		desc = "import <>",
	}, { t("import"), i(1) }, { condition = conds.line_begin }),
	-- }}}
	-- from <> import <> {{{
	s(
		{
			trig = "_fr",
			snippetType = "autosnippet",
			desc = "from <> import <>",
		},
		fmta(
			[[
      from <> import <>
      ]],
			{
				i(1, "module"),
				i(2, "function"),
			}
		),
		{ condition = conds.line_begin }
	),
	-- }}}
	-- from datetime import datetime {{{
	s({
		trig = "_dt",
		snippetType = "autosnippet",
		desc = "from datetime import datetime",
	}, { t("from datetime import datetime") }, { condition = conds.line_begin }),
	-- }}}
	-- import re {{{
	s({
		trig = "_re",
		snippetType = "autosnippet",
		desc = "import re",
	}, { t("import re") }, { condition = conds.line_begin }),
	-- }}}
	-- def main(): {{{
	s(
		{
			trig = "dmain",
			snippetType = "autosnippet",
			desc = "def main():",
		},
		fmta(
			[[
      def main():
          <>
      ]],
			{
				i(0),
			}
		),
		{ condition = conds.line_begin }
	),
	-- }}}
	-- if __name__ == __main__: {{{
	s(
		{
			trig = "imain",
			snippetType = "autosnippet",
			desc = "if __name__ == __main__:",
		},
		fmta(
			[[
      <>:
          <>
      ]],
			{
				t([[if __name__ == "__main__"]]),
				t([[main()]]),
			}
		),
		{ condition = conds.line_begin }
	),
	-- }}}
	-- print() {{{
	s({
		trig = "print",
		snippetType = "autosnippet",
		desc = "print()",
	}, fmta([[print("<>")]], { i(1) }), { condition = conds.line_begin }),
	-- }}}
	-- re.compile() {{{
	s({
		trig = "re.c",
		snippetType = "autosnippet",
		desc = "re.compile()",
	}, fmta([[re.compile(r'<>')]], { i(1) })),
	-- }}}
}
