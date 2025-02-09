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
	-- from {{{
	s(
		{
			trig = "from",
			snippetType = "autosnippet",
			desc = "from",
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
	}, fmta([[print(<>)]], { i(1) }), { condition = conds.line_begin }),
	-- }}}
}
