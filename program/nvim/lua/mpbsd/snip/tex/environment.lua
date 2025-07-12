local utils = require("mpbsd.core.glb").utils

return {
	-- abstract {{{
	s(
		{
			trig = "abs",
			snippetType = "autosnippet",
			desc = "abstract",
		},
		fmta(
			[[
	    \begin{abstract}
	      <>
	    \end{abstract}
			]],
			{ i(1) }
		),
		{ condition = conds.line_begin }
	),
	-- }}}
	-- align {{{
	s(
		{
			trig = "ali",
			snippetType = "autosnippet",
			desc = "align",
		},
		fmta(
			[[
	    \begin{align}
	      <>
	    \end{align}
			]],
			{ i(1) }
		),
		{ condition = conds.line_begin }
	),
	-- }}}
	-- generic {{{
	s(
		{
			trig = "beg",
			snippetType = "autosnippet",
			desc = "generic",
		},
		fmta(
			[[
	    \begin{<>}
	      <>
	    \end{<>}
			]],
			{ i(1), i(2), rep(1) }
		),
		{ condition = conds.line_begin }
	),
	-- }}}
	-- corollary {{{
	s(
		{
			trig = "cor",
			snippetType = "autosnippet",
			desc = "corollary",
		},
		fmta(
			[[
	    \begin{corollary}\label{cor:<>}
	      <>
	    \end{corollary}
			]],
			{ i(1), i(2) }
		),
		{ condition = conds.line_begin }
	),
	-- }}}
	-- definition {{{
	s(
		{
			trig = "def",
			snippetType = "autosnippet",
			desc = "definition",
		},
		fmta(
			[[
	    \begin{definition}\label{def:<>}
	      <>
	    \end{definition}
			]],
			{ i(1), i(2) }
		),
		{ condition = conds.line_begin }
	),
	-- }}}
	-- description {{{
	s(
		{
			trig = "des",
			snippetType = "autosnippet",
			desc = "description",
		},
		fmta(
			[[
	    \begin{description}
	      \item[<>] <>
	    \end{description}
	    ]],
			{ i(1), i(2) }
		),
		{ condition = conds.line_begin }
	),
	-- }}}
	-- enumerate {{{
	s(
		{
			trig = "enu",
			snippetType = "autosnippet",
			desc = "enumerate",
		},
		fmta(
			[[
	    \begin{enumerate}
	      \item <>
	    \end{enumerate}
	    ]],
			{ i(1) }
		),
		{ condition = conds.line_begin }
	),
	-- }}}
	-- equation {{{
	s(
		{
			trig = "equ",
			snippetType = "autosnippet",
			desc = "equation",
		},
		fmta(
			[[
	    \begin{equation}\label{eq:<>}
	      <>
	    \end{equation}
	    ]],
			{ i(1), i(2) }
		),
		{ condition = conds.line_begin }
	),
	-- }}}
	-- frame {{{
	s(
		{
			trig = "fra",
			snippetType = "autosnippet",
			desc = "frame",
		},
		fmta(
			[[
	    \begin{frame}{<>}
	      <>
	    \end{frame}
	    ]],
			{ i(1), i(2) }
		),
		{ condition = conds.line_begin }
	),
	-- }}}
	-- itemize {{{
	s(
		{
			trig = "ite",
			snippetType = "autosnippet",
			desc = "itemize",
		},
		fmta(
			[[
	    \begin{itemize}
	      \item <>
	    \end{itemize}
	    ]],
			{ i(1) }
		),
		{ condition = conds.line_begin }
	),
	-- }}}
	-- lemma {{{
	s(
		{
			trig = "lem",
			snippetType = "autosnippet",
			desc = "lemma",
		},
		fmta(
			[[
	    \begin{lemma}\label{lem:<>}
	      <>
	    \end{lemma}
	    ]],
			{ i(1), i(2) }
		),
		{ condition = conds.line_begin }
	),
	-- }}}
	-- proposition {{{
	s(
		{
			trig = "prp",
			snippetType = "autosnippet",
			desc = "proposition",
		},
		fmta(
			[[
	    \begin{proposition}\label{prop:<>}
	      <>
	    \end{proposition}
	    ]],
			{ i(1), i(2) }
		),
		{ condition = conds.line_begin }
	),
	-- }}}
	-- remark {{{
	s(
		{
			trig = "rmk",
			snippetType = "autosnippet",
			desc = "remark",
		},
		fmta(
			[[
	    \begin{remark}\label{rmk:<>}
	      <>
	    \end{remark}
	    ]],
			{ i(1), i(2) }
		),
		{ condition = conds.line_begin }
	),
	-- }}}
	-- theorem {{{
	s(
		{
			trig = "thm",
			snippetType = "autosnippet",
			desc = "theorem",
		},
		fmta(
			[[
	    \begin{theorem}\label{thm:<>}
	      <>
	    \end{theorem}
	    ]],
			{ i(1), i(2) }
		),
		{ condition = conds.line_begin }
	),
	-- }}}
	-- inline math mode {{{
	s(
		{
			trig = "((",
			snippetType = "autosnippet",
			desc = "inline math mode",
		},
		fmta(
			[[
        \(<>\)
      ]],
			{ i(1) }
		),
		{ condition = conds.in_text }
	),
	-- }}}
	-- display math mode {{{
	s(
		{
			trig = "[[",
			snippetType = "autosnippet",
			desc = "display math mode",
		},
		fmta(
			[[
      \[
        <>
      \]
      ]],
			{ i(1) }
		),
		{ condition = conds.in_text }
	),
	-- }}}
	-- delimiters {{{
	s(
		{
			trig = [[(d)([pPbBcCg])]],
			regTrig = true,
			trigEngine = "ecma",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "delimiters",
		},
		fmta(
			[[
	    <><><>
			]],
			{
				f(utils.delimiter, {}, { user_args = { "lhs" } }),
				i(1),
				f(utils.delimiter, {}, { user_args = { "rhs" } }),
			}
		),
		{ condition = utils.in_math }
	),
	-- }}}
	-- dynamic_matrix {{{
	s(
		{
			trig = [[([bBp])mat(\d+)(\d+)]],
			regTrig = true,
			trigEngine = "ecma",
			snippetType = "autosnippet",
			desc = "dynamic matrix",
		},
		fmta(
			[[
	    \begin{<>}
	      <>
	    \end{<>}
	    ]],
			{
				l(l.CAPTURE1 .. "matrix", {}),
				d(1, utils.dynamic_matrix),
				l(l.CAPTURE1 .. "matrix", {}),
			}
		),
		{ condition = utils.in_math }
	),
	-- }}}
}
