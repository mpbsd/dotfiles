return {
	s({
		trig = "^from",
		snippetType = "autosnippet",
		regTrig = true,
		wordTrig = false,
		desc = "from imports",
	}, fmta([[from <> import <>]], { i(1), i(2) })),
	s(
		{
			trig = "^main",
			snippetType = "autosnippet",
			regTrig = true,
			wordTrig = false,
			desc = "",
		},
		fmta(
			[[
      def main():
          <>


      if __name__ == "__main__":
          main()
      ]],
			{ i(1) }
		)
	),
}
