-- local utils = require("mpbsd.core.glb").utils

return {
	-- article template {{{
	s(
		{
			trig = "_article",
			snippetType = "autosnippet",
			desc = "article template",
		},
		fmta(
			[[
	     \documentclass[a4paper,12pt]{article}
	     <>
	     \usepackage[T1]{fontenc}
	     \usepackage[english]{babel}
	     \usepackage{amsmath}
	     \usepackage{amssymb}
	     \usepackage{amsthm}
	     \usepackage{enumerate}
	     \usepackage{graphicx}
	     \usepackage{float}
	     \usepackage{hyperref}
	     \usepackage{interval}
	     \usepackage{mathtools}
	     \usepackage{stmaryrd}
	     \usepackage[table]{xcolor}
	     <>
	     \graphicspath{{./fig/}}
	     \intervalconfig{soft open fences}
	     <>
	     \title{an awesome title}
	     \author{list of authors}
	     <>
	     \begin{document}
	     <>
	     \maketitle
	     <>
	     % \input{sec/01}  % introduction
	     % \input{sec/02}  % results
	     % \input{sec/03}  % examples
	     \input{sec/04}  % proofs
	     <>
	     \bibliographystyle{plain}
	     \bibliography{ref/main}
       <>
	     \end{document}
			]],
			{
				t(""),
				t(""),
				t(""),
				t(""),
				t(""),
				t(""),
				i(0),
				t(""),
			}
		),
		{ condition = conds.line_begin }
	),
	-- }}}
	-- package with options {{{
	s(
		{
			trig = "opt",
			snippetType = "autosnippet",
			desc = "package with options",
		},
		fmta(
			[[
      \usepackage[<>]{<>}
      ]],
			{ i(1, "opt"), i(2, "pkg") }
		),
		{ condition = conds.line_begin }
	),
	-- }}}
	-- package without options {{{
	s(
		{
			trig = "pkg",
			snippetType = "autosnippet",
			desc = "package without options",
		},
		fmta(
			[[
      \usepackage{<>}
      ]],
			{ i(1, "pkg") }
		),
		{ condition = conds.line_begin }
	),
	-- }}}
	-- mid range set of packages {{{
	s(
		{
			trig = "_mid",
			snippetType = "autosnippet",
			desc = "mid range set of package",
		},
		t({
			[[\usepackage[T1]{fontenc}]],
			[[\usepackage[english]{babel}]],
			[[\usepackage{amsmath}]],
			[[\usepackage{amssymb}]],
			[[\usepackage{amsthm}]],
			[[\usepackage{enumerate}]],
			[[\usepackage{graphicx}]],
			[[\usepackage{float}]],
			[[\usepackage{hyperref}]],
			[[\usepackage{interval}]],
			[[\usepackage{mathtools}]],
			[[\usepackage{stmaryrd}]],
			[[\usepackage[table]{xcolor}]],
		}),
		{ condition = conds.line_begin }
	),
	-- }}}
}
