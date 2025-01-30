return {
	-- today's date {{{
	s({
		trig = "today",
		desc = "today's date",
	}, p(os.date, "%Y-%m-%d")),
	-- }}}
}
