-- local utils = require("snp")

return {
	-- introduction {{{
	s(
		{
			trig = "_introduction",
			snippetType = "autosnippet",
			desc = "introduction",
		},
		fmta(
			[[
	    \section{Introduction}\label{sec:introduction}
	    <>
	    <>
			]],
			{ t(""), i(0) }
		),
		{ condition = conds.line_begin }
	),
	-- }}}
	-- results {{{
	s(
		{
			trig = "_results",
			snippetType = "autosnippet",
			desc = "results",
		},
		fmta(
			[[
	    \section{Results}\label{sec:results}
	    <>
	    <>
			]],
			{ t(""), i(0) }
		),
		{ condition = conds.line_begin }
	),
	-- }}}
	-- examples {{{
	s(
		{
			trig = "_examples",
			snippetType = "autosnippet",
			desc = "examples",
		},
		fmta(
			[[
	    \section{Examples}\label{sec:examples}
	    <>
	    <>
			]],
			{ t(""), i(0) }
		),
		{ condition = conds.line_begin }
	),
	-- }}}
	-- proofs {{{
	s(
		{
			trig = "_proofs",
			snippetType = "autosnippet",
			desc = "proofs",
		},
		fmta(
			[[
	    \section{Proofs}\label{sec:proofs}
	    <>
	    <>
			]],
			{ t(""), i(0) }
		),
		{ condition = conds.line_begin }
	),
	-- }}}
	-- labeled chapter {{{
	s(
		{
			trig = [[^cha]],
			regTrig = true,
			trigEngine = "ecma",
			snippetType = "autosnippet",
			desc = "labeled chapter",
		},
		fmta(
			[[
	    \chapter{<>}\label{chp:<>}
	    <>
	    <>
			]],
			{
				i(1),
				l(l._1:gsub("%W+", "_"):lower(), { 1 }),
				t(""),
				i(0),
			},
			{ condition = conds.line_begin }
		)
	),
	-- }}}
	-- labeled section {{{
	s(
		{
			trig = [[^sec]],
			regTrig = true,
			trigEngine = "ecma",
			snippetType = "autosnippet",
			desc = "labeled section",
		},
		fmta(
			[[
	    \section{<>}\label{sec:<>}
	    <>
	    <>
			]],
			{
				i(1),
				l(l._1:gsub("%W+", "_"):lower(), { 1 }),
				t(""),
				i(0),
			},
			{ condition = conds.line_begin }
		)
	),
	-- }}}
	-- labeled subsection {{{
	s(
		{
			trig = [[^subsec]],
			regTrig = true,
			trigEngine = "ecma",
			snippetType = "autosnippet",
			desc = "labeled subsection",
		},
		fmta(
			[[
	    \subsection{<>}\label{subsec:<>}
	    <>
	    <>
			]],
			{
				i(1),
				l(l._1:gsub("%W+", "_"):lower(), { 1 }),
				t(""),
				i(0),
			},
			{ condition = conds.line_begin }
		)
	),
	-- }}}
	-- labeled subsubsection {{{
	s(
		{
			trig = [[^subsubsec]],
			regTrig = true,
			trigEngine = "ecma",
			snippetType = "autosnippet",
			desc = "labeled subsubsection",
		},
		fmta(
			[[
	    \subsubsection{<>}\label{subsubsec:<>}
	    <>
	    <>
			]],
			{
				i(1),
				l(l._1:gsub("%W+", "_"):lower(), { 1 }),
				t(""),
				i(0),
			},
			{ condition = conds.line_begin }
		)
	),
	-- }}}
}
