local helper = {
	-- in_math {{{1
	in_math = function()
		return vim.fn["vimtex#syntax#in_mathzone"]() == 1
	end,
	-- }}}
	-- in_text {{{1
	in_text = function()
		return vim.fn["vimtex#syntax#in_mathzone"]() ~= 1
	end,
	-- }}}
	-- delimiter {{{1
	delimiter = function(_, snip, user_args)
		local D = {
			p = {
				lhs = [[(]],
				rhs = [[)]],
			},
			P = {
				lhs = [[\left(]],
				rhs = [[\right)]],
			},
			b = {
				lhs = "[",
				rhs = "]",
			},
			B = {
				lhs = "\\left[",
				rhs = "\\right]",
			},
			c = {
				lhs = [[\{]],
				rhs = [[\}]],
			},
			C = {
				lhs = [[\left\{]],
				rhs = [[\right\}]],
			},
			g = {
				lhs = [[{]],
				rhs = [[}]],
			},
		}
		return D[snip.captures[2]][user_args]
	end,
	-- }}}
	-- greek {{{1
	greek = function(_, snip)
		local alphabet = {
			a = "alpha",
			b = "beta",
			g = "gamma",
			d = "delta",
			e = "epsilon",
			z = "zeta",
			h = "eta",
			j = "theta",
			i = "iota",
			k = "kappa",
			l = "lambda",
			m = "mu",
			n = "nu",
			x = "xi",
			p = "pi",
			r = "rho",
			s = "sigma",
			t = "tau",
			u = "upsilon",
			f = "phi",
			c = "chi",
			y = "psi",
			w = "omega",
			G = "Gamma",
			D = "Delta",
			J = "Theta",
			L = "Lambda",
			X = "Xi",
			P = "Pi",
			S = "Sigma",
			U = "Upsilon",
			F = "Phi",
			Y = "Psi",
			W = "Omega",
			ve = "varepsilon",
			vj = "vartheta",
			vp = "varpi",
			vs = "varsigma",
			vr = "varrho",
			vf = "varphi",
		}
		return [[\]] .. alphabet[snip.captures[1]]
	end,
	-- }}}
	-- mathfn {{{
	mathfn = function(_, snip)
		local F = {
			cos = [[cos]],
			sin = [[sin]],
			tan = [[tan]],
			acos = [[arccos]],
			asin = [[arcsin]],
			atan = [[arctan]],
			sec = [[sec]],
			csc = [[csc]],
			cot = [[cot]],
			asec = [[arcsec]],
			acsc = [[arccsc]],
			acot = [[arccot]],
			cosh = [[cosh]],
			sinh = [[sinh]],
			tanh = [[tanh]],
			acosh = [[arccosh]],
			asinh = [[arcsinh]],
			atanh = [[arctanh]],
			sech = [[sech]],
			csch = [[csch]],
			coth = [[coth]],
			asech = [[arcsech]],
			acsch = [[arccsch]],
			acoth = [[arccoth]],
			exp = [[e^]],
			log = [[log]],
			ln = [[ln]],
		}
		return F[snip.captures[1]]
	end,
	-- }}}
	-- matrix {{{1
	matrix = function(_, snip)
		local rows = tonumber(snip.captures[2])
		local cols = tonumber(snip.captures[3])
		local node = {}
		local indx = 1
		for R = 1, rows do
			for C = 1, cols do
				local x_RC = "x_{" .. tostring(R) .. tostring(C) .. "}"
				table.insert(node, i(indx, x_RC))
				if C < cols then
					table.insert(node, t([[ & ]]))
				else
					if R < rows then
						table.insert(node, t({ [[ \\ ]], "" }))
					else
						table.insert(node, t([[ \\ ]]))
					end
				end
				indx = indx + 1
			end
		end
		return sn(nil, node)
	end,
	-- }}}
}

return {
	-- templates {{{1
	-- article {{{2
	s(
		{
			trig = [[^\s*;article]],
			regTrig = true,
			docTrig = [[\s*;article]],
			trigEngine = "ecma",
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
		{ condition = helper.in_text }
	),
	-- }}}
	-- mid range set of packages {{{2
	s(
		{
			trig = [[^\s*;mid]],
			regTrig = true,
			docTrig = [[\s*;mid]],
			trigEngine = "ecma",
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
		{ condition = helper.in_text }
	),
	-- }}}
	-- }}}
	-- loading packages {{{1
	-- package with options {{{2
	s(
		{
			trig = [[^\s*;opt]],
			regTrig = true,
			docTrig = [[\s*;opt]],
			trigEngine = "ecma",
			snippetType = "autosnippet",
			desc = "with options",
		},
		fmta(
			[[
      \usepackage[<>]{<>}
      ]],
			{ i(1, "opt"), i(2, "pkg") }
		),
		{ condition = helper.in_text }
	),
	-- }}}
	-- package without options {{{2
	s(
		{
			trig = [[^\s*;pkg]],
			regTrig = true,
			docTrig = [[\s*;pkg]],
			trigEngine = "ecma",
			snippetType = "autosnippet",
			desc = "without options",
		},
		fmta(
			[[
      \usepackage{<>}
      ]],
			{ i(1, "pkg") }
		),
		{ condition = helper.in_text }
	),
	-- }}}
	-- }}}
	-- headers {{{1
	-- introduction {{{2
	s(
		{
			trig = [[^\s*;introduction]],
			regTrig = true,
			docTrig = [[\s*;introduction]],
			trigEngine = "ecma",
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
		{ condition = helper.in_text }
	),
	-- }}}
	-- results {{{2
	s(
		{
			trig = [[^\s*;results]],
			regTrig = true,
			docTrig = [[\s*;results]],
			trigEngine = "ecma",
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
		{ condition = helper.in_text }
	),
	-- }}}
	-- examples {{{2
	s(
		{
			trig = [[^\s*;examples]],
			regTrig = true,
			docTrig = [[\s*;examples]],
			trigEngine = "ecma",
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
		{ condition = helper.in_text }
	),
	-- }}}
	-- proofs {{{2
	s(
		{
			trig = [[^\s*;proofs]],
			regTrig = true,
			docTrig = [[\s*;proofs]],
			trigEngine = "ecma",
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
		{ condition = helper.in_text }
	),
	-- }}}
	-- labeled chapter {{{2
	s(
		{
			trig = [[^\s*;chapter]],
			regTrig = true,
			docTrig = [[\s*;chapter]],
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
			{ condition = helper.in_text }
		)
	),
	-- }}}
	-- labeled section {{{2
	s(
		{
			trig = [[^\s*;section]],
			regTrig = true,
			docTrig = [[\s*;section]],
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
			{ condition = helper.in_text }
		)
	),
	-- }}}
	-- labeled subsection {{{2
	s(
		{
			trig = [[^\s*;subsection]],
			regTrig = true,
			docTrig = [[\s*;subsection]],
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
			{ condition = helper.in_text }
		)
	),
	-- }}}
	-- labeled subsubsection {{{2
	s(
		{
			trig = [[^\s*;subsubsection]],
			regTrig = true,
			docTrig = [[\s*;subsubsection]],
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
			{ condition = helper.in_text }
		)
	),
	-- }}}
	-- abstract {{{2
	s(
		{
			trig = [[^\s*;abstract]],
			regTrig = true,
			docTrig = [[\s*;abstract]],
			trigEngine = "ecma",
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
		{ condition = helper.in_text }
	),
	-- }}}
	-- align {{{2
	s(
		{
			trig = [[^\s*;align]],
			regTrig = true,
			docTrig = [[\s*;align]],
			trigEngine = "ecma",
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
		{ condition = helper.in_text }
	),
	-- }}}
	-- generic {{{2
	s(
		{
			trig = [[^\s*;begin]],
			regTrig = true,
			docTrig = [[\s*;begin]],
			trigEngine = "ecma",
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
		{ condition = helper.in_text }
	),
	-- }}}
	-- corollary {{{2
	s(
		{
			trig = [[^\s*;corollary]],
			regTrig = true,
			docTrig = [[\s*;corollary]],
			trigEngine = "ecma",
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
		{ condition = helper.in_text }
	),
	-- }}}
	-- definition {{{2
	s(
		{
			trig = [[^\s*;definition]],
			regTrig = true,
			docTrig = [[\s*;definition]],
			trigEngine = "ecma",
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
		{ condition = helper.in_text }
	),
	-- }}}
	-- description {{{2
	s(
		{
			trig = [[^\s*;description]],
			regTrig = true,
			docTrig = [[\s*;description]],
			trigEngine = "ecma",
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
		{ condition = helper.in_text }
	),
	-- }}}
	-- enumerate {{{2
	s(
		{
			trig = [[^\s*;enumerate]],
			regTrig = true,
			docTrig = [[\s*;enumerate]],
			trigEngine = "ecma",
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
		{ condition = helper.in_text }
	),
	-- }}}
	-- equation {{{2
	s(
		{
			trig = [[^\s*;equation]],
			regTrig = true,
			docTrig = [[\s*;equation]],
			trigEngine = "ecma",
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
		{ condition = helper.in_text }
	),
	-- }}}
	-- frame {{{2
	s(
		{
			trig = [[^\s*;frame]],
			regTrig = true,
			docTrig = [[\s*;frame]],
			trigEngine = "ecma",
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
		{ condition = helper.in_text }
	),
	-- }}}
	-- itemize {{{2
	s(
		{
			trig = [[^\s*;itemize]],
			regTrig = true,
			docTrig = [[\s*;itemize]],
			trigEngine = "ecma",
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
		{ condition = helper.in_text }
	),
	-- }}}
	-- lemma {{{2
	s(
		{
			trig = [[^\s*;lemma]],
			regTrig = true,
			docTrig = [[\s*;lemma]],
			trigEngine = "ecma",
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
		{ condition = helper.in_text }
	),
	-- }}}
	-- matrix {{{2
	s(
		{
			trig = [[([bBp])mat([0-9]+)([0-9]+)]],
			regTrig = true,
			docTrig = [[bmat22]],
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
				d(1, helper.matrix),
				l(l.CAPTURE1 .. "matrix", {}),
			}
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- proposition {{{2
	s(
		{
			trig = [[^\s*;proposition]],
			regTrig = true,
			docTrig = [[\s*;proposition]],
			trigEngine = "ecma",
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
		{ condition = helper.in_text }
	),
	-- }}}
	-- remark {{{2
	s(
		{
			trig = [[^\s*;remark]],
			regTrig = true,
			docTrig = [[\s*;remark]],
			trigEngine = "ecma",
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
		{ condition = helper.in_text }
	),
	-- }}}
	-- theorem {{{2
	s(
		{
			trig = [[^\s*;theorem]],
			regTrig = true,
			docTrig = [[\s*;theorem]],
			trigEngine = "ecma",
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
		{ condition = helper.in_text }
	),
	-- }}}
	-- }}}
	-- math mode {{{1
	-- inline math mode {{{2
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
		{ condition = helper.in_text }
	),
	-- }}}
	-- display math mode {{{2
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
		{ condition = helper.in_text }
	),
	-- }}}
	-- }}}
	-- delimiters {{{1
	-- delimiters {{{2
	s(
		{
			trig = [[(d)([pPbBcCg])]],
			regTrig = true,
			docTrig = "dp",
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
				f(helper.delimiter, {}, { user_args = { "lhs" } }),
				i(1),
				f(helper.delimiter, {}, { user_args = { "rhs" } }),
			}
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- }}}
	-- sets {{{1
	-- for all {{{2
	s(
		{
			trig = [[;fa]],
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "for all",
		},
		fmta(
			[[
      \forall\,{<>}\in{<>}
      ]],
			{ i(1, "x"), i(2, "A") }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- there exists {{{2
	s(
		{
			trig = [[;te]],
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "there exists",
		},
		fmta(
			[[
      \exists\,{<>}\in{<>}
      ]],
			{ i(1, "x"), i(2, "A") }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- belongs to {{{2
	s(
		{
			trig = [[;ee]],
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "belongs to",
		},
		fmta(
			[[
      {<>}\in{<>}
      ]],
			{ i(1, "x"), i(2, "A") }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- owns {{{2
	s(
		{
			trig = [[;EE]],
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "owns",
		},
		fmta(
			[[
      {<>}\owns{<>}
      ]],
			{ i(1, "A"), i(2, "x") }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- subset {{{2
	s(
		{
			trig = [[;cc]],
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "subset",
		},
		fmta(
			[[
      {<>}\subset{<>}
      ]],
			{ i(1, "A"), i(2, "B") }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- subset {{{2
	s(
		{
			trig = [[;CC]],
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "subset",
		},
		fmta(
			[[
      {<>}\supset{<>}
      ]],
			{ i(1, "A"), i(2, "B") }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- cup {{{2
	s(
		{
			trig = [[;uu]],
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "cup",
		},
		fmta(
			[[
      {<>}\cup{<>}
      ]],
			{ i(1, "A"), i(2, "B") }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- bigcup {{{2
	s(
		{
			trig = [[;UU]],
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "bigcup",
		},
		fmta(
			[[
      \bigcup_{<>}<>
      ]],
			{ i(1, [[i\in{I}]]), i(2, [[U_{i}]]) }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- cap {{{2
	s(
		{
			trig = [[;nn]],
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "cap",
		},
		fmta(
			[[
      {<>}\cap{<>}
      ]],
			{ i(1, "A"), i(2, "B") }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- bigcap {{{2
	s(
		{
			trig = [[;NN]],
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "bigcap",
		},
		fmta(
			[[
      \bigcap_{<>}<>
      ]],
			{ i(1, [[i\in{I}]]), i(2, [[U_{i}]]) }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- times {{{2
	s(
		{
			trig = [[;xx]],
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "times",
		},
		fmta(
			[[
      {<>}\times{<>}
      ]],
			{ i(1, "A"), i(2, "B") }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- cartesian product {{{2
	s(
		{
			trig = [[;XX]],
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "cartesian product",
		},
		fmta(
			[[
      \prod_{<>}<>
      ]],
			{ i(1, [[i\in{I}]]), i(2, [[U_{i}]]) }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- absolute complement {{{2
	s(
		{
			trig = [[;ac]],
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "absolute complement",
		},
		fmta(
			[[
      {<>}\setminus{<>}
      ]],
			{ i(1, "A"), i(2, "B") }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- relative complement {{{2
	s({
		trig = [[;rc]],
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "relative complement",
	}, t([[^{c}]]), { condition = helper.in_math }),
	-- }}}
	-- empty set {{{2
	s({
		trig = [[;OO]],
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "empty set",
	}, t([[\emptyset]]), { condition = helper.in_math }),
	-- }}}
	-- numerical sets {{{2
	s(
		{
			trig = [[(?<=\\)([nzqrc])\1]],
			regTrig = true,
			docTrig = [[\nn]],
			trigEngine = "ecma",
			snippetType = "autosnippet",
			desc = "numerical sets",
		},
		f(function(_, snip)
			local M = {
				["n"] = [[mathbb{N}]],
				["z"] = [[mathbb{Z}]],
				["q"] = [[mathbb{Q}]],
				["r"] = [[mathbb{R}]],
				["c"] = [[mathbb{C}]],
			}
			return M[snip.captures[1]]
		end),
		{ condition = helper.in_math }
	),
	-- }}}
	-- }}}
	-- functions {{{1
	-- function action {{{2
	s(
		{
			trig = "fna",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "function action",
		},
		fmta(
			[[
	    {<>}\mapsto{<>}
	    ]],
			{ i(1, "x"), i(2, "f(x)") }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- function definition {{{2
	s(
		{
			trig = "fnd",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "function declaration",
		},
		fmta(
			[[
	    {<>}:{<>}\to{<>},\quad{{<>}\mapsto{<>}}
	    ]],
			{ i(1, "f"), i(2, "A"), i(3, "B"), i(4, "x"), i(5, "f(x)") }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- function reference {{{2
	s(
		{
			trig = "fnr",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "function reference",
		},
		fmta(
			[[
	    {<>}{\left(<>\right)}
	    ]],
			{ i(1, "f"), i(2, "x") }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- trigonometric, exponential, logarithmic and hyperbolic functions {{{2
	s(
		{
			trig = [[(?<=\\)(a?(cos|sin|tan|sec|csc|cot)h?|exp|log|ln)]],
			regTrig = true,
			docTrig = [[\cos]],
			trigEngine = "ecma",
			wordTrig = false,
			desc = "trigonometric, exponential, logarithmic and hyperbolic functions",
		},
		fmta(
			[[
	    <>{\left(<>\right)}<>
			]],
			{
				f(helper.mathfn),
				i(1),
				i(0),
			}
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- abs, norm, order {{{2
	s(
		{
			trig = [[(?<=\\)(abs|norm|order)]],
			regTrig = true,
			docTrig = [[\abs]],
			trigEngine = "ecma",
			wordTrig = false,
			desc = "trigonometric, exponential, logarithmic and hyperbolic functions",
		},
		fmta(
			[[
	    <>{<>}<>
			]],
			{
				l(l.CAPTURE1, {}),
				i(1),
				i(0),
			}
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- }}}
	-- binary operations, relations, inverse {{{1
	-- less than or equal to {{{2
	s(
		{
			trig = "<=",
			snippetType = "autosnippet",
			desc = "less than or equal to",
		},
		fmta(
			[[
	    {<>}\leqslant{<>}
	    ]],
			{ i(1, "x"), i(2, "y") }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- greater than or equal to {{{2
	s(
		{
			trig = ">=",
			snippetType = "autosnippet",
			desc = "greater than or equal to",
		},
		fmta(
			[[
	    {<>}\geqslant{<>}
	    ]],
			{ i(1, "x"), i(2, "y") }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- sum {{{2
	s(
		{
			trig = "++",
			snippetType = "autosnippet",
			desc = "sum",
		},
		fmta(
			[[
	    \sum_{<>=<>}^{<>}<>
	    ]],
			{ i(1, "i"), i(2, "0"), i(3, "n-1"), i(4, "x_{i}") }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- product {{{2
	s(
		{
			trig = "**",
			snippetType = "autosnippet",
			desc = "product",
		},
		fmta(
			[[
	    \prod_{<>=<>}^{<>}<>
	    ]],
			{ i(1, "i"), i(2, "0"), i(3, "n-1"), i(4, "x_{i}") }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- fraction {{{2
	s(
		{
			trig = "//",
			snippetType = "autosnippet",
			desc = "fraction",
		},
		fmta(
			[[
	    \frac{<>}{<>}
	    ]],
			{ i(1, "x"), i(2, "y") }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- su(b|per)script {{{2
	s(
		{
			trig = [[([_^])\1]],
			regTrig = true,
			docTrig = [[__]],
			trigEngine = "ecma",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "su(b|per)script",
		},
		fmta(
			[[
	    <>{<>}
	    ]],
			{
				l(l.CAPTURE1, {}),
				i(1),
			}
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- inverse {{{2
	s({
		trig = [[(?<=\^)-1]],
		regTrig = true,
		docTrig = [[\^-1]],
		trigEngine = "ecma",
		snippetType = "autosnippet",
		desc = "inverse",
	}, t([[{-1}]]), { condition = helper.in_math }),
	-- }}}
	-- }}}
	-- symbols {{{1
	-- greek letters {{{2
	s({
		trig = [[`([abgdezhjiklmnxprstufcyw]|[GDJLXPSUFYW]|v[ejpsrf])]],
		regTrig = true,
		docTrig = [[`a]],
		trigEngine = "ecma",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "greek letters",
	}, f(helper.greek), { condition = helper.in_math }),
	-- }}}
	-- infity {{{2
	s({
		trig = [[oo]],
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "infinity",
	}, t([[\infty]]), { condition = helper.in_math }),
	-- }}}
	-- dots {{{2
	s({
		trig = [[(?<!\\)([cdlv]dots)]],
		regTrig = true,
		docTrig = [[acdots]],
		trigEngine = "ecma",
		snippetType = "autosnippet",
		desc = "dots",
	}, l([[\]] .. l.CAPTURE1), { condition = helper.in_math }),
	-- }}}
	-- }}}
	-- algebraic structures {{{1
	-- custom commands for typesetting stuff related to group theory {{{2
	s(
		{
			trig = [[^\s*;group]],
			regTrig = true,
			docTrig = [[\s*;group]],
			trigEngine = "ecma",
			snippetType = "autosnippet",
			desc = "custom commands for group theory",
		},
		t({
			[[\DeclarePairedDelimiter{\order}{\lvert}{\rvert}]],
			[[\newcommand{\subgroup}{\leqslant}]],
			[[\newcommand{\normalsubgroup}{\trianglelefteqslant}]],
		}),
		{ condition = helper.in_text }
	),
	-- }}}
	-- subgroup {{{2
	s(
		{
			trig = ";sg",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "subgroup",
		},
		fmta(
			[[
      {<>}\subgroup{<>}
      ]],
			{ i(1, "H"), i(2, "G") }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- normal subgroup {{{2
	s(
		{
			trig = ";ns",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "normal subgroup",
		},
		fmta(
			[[
      {<>}\normalsubgroup{<>}
      ]],
			{ i(1, "N"), i(2, "G") }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- lagrange's theorem {{{2
	s(
		{
			trig = ";lt",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "lagrange's theorem",
		},
		fmta(
			[[
      \order{<>}=\left[<>:<>\right]\order{<>}
      ]],
			{ i(1, "G"), rep(1), i(2, "H"), rep(2) }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- galois group {{{2
	s(
		{
			trig = [[gg([a-z])([a-z])]],
			regTrig = true,
			docTrig = [[ggkf]],
			trigEngine = "ecma",
			snippetType = "autosnippet",
			desc = "galois group",
		},
		f(function(_, snip)
			local K = snip.captures[1]:upper()
			local F = snip.captures[2]:upper()
			if snip.captures[2]:match("[qrc]") then
				F = [[\mathbb{]] .. snip.captures[2]:upper() .. [[}]]
			end
			return "G(" .. K .. "," .. F .. ")"
		end),
		{ condition = helper.in_math }
	),
	-- }}}
	-- polynomial rings {{{2
	s(
		{
			trig = [[(?<=\\)([zqrc])([xt])]],
			regTrig = true,
			docTrig = [[\zx]],
			trigEngine = "ecma",
			snippetType = "autosnippet",
			desc = "polynomial rings",
		},
		f(function(_, snip)
			local M = {
				["z"] = [[mathbb{Z}]],
				["q"] = [[mathbb{Q}]],
				["r"] = [[mathbb{R}]],
				["c"] = [[mathbb{C}]],
			}
			return M[snip.captures[1]] .. "[" .. snip.captures[2] .. "]"
		end),
		{ condition = helper.in_math }
	),
	-- }}}
	-- }}}
	-- analysis {{{1
	-- custom commands for typesetting stuff related to analysis {{{2
	s(
		{
			trig = [[^\s*;analysis]],
			regTrig = true,
			docTrig = [[\s*;analysis]],
			trigEngine = "ecma",
			snippetType = "autosnippet",
			desc = "custom commands for typesetting stuff related to analysis",
		},
		t({
			[[\DeclarePairedDelimiter{\abs}{\lvert}{\rvert}]],
			[[\DeclarePairedDelimiter{\norm}{\lVert}{\rVert}]],
		}),
		{ condition = helper.in_text }
	),
	-- }}}
	-- }}}
	-- differential geometry {{{1
	-- custom commands for differential geometry {{{2
	s(
		{
			trig = [[^\s*;geometry]],
			regTrig = true,
			docTrig = [[\s*;geometry]],
			trigEngine = "ecma",
			snippetType = "autosnippet",
			desc = "custom commands for differential geometry",
		},
		t({
			[[\newcommand{\X}[1]{\partial_{#1}}]],
			[[\newcommand{\flatMetr}[2]{g{\left({#1},{#2}\right)}}]],
			[[\newcommand{\flatConn}[2]{\nabla_{#1}{#2}}]],
			[[\newcommand{\riemMetr}[2]{\bar{g}{\left({#1},{#2}\right)}}]],
			[[\newcommand{\riemConn}[2]{\bar{\nabla}_{#1}{#2}}]],
			[[\newcommand{\curvTens}[2]{\bar{R}m\left({#1},{#2}\right)}]],
			[[\newcommand{\riccTens}[2]{\bar{R}c\left({#1},{#2}\right)}]],
		}),
		{ condition = helper.in_text }
	),
	-- }}}
	-- n-dimensional differentiable manifold {{{2
	s({
		trig = "Mn",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "n-dimensional differentiable manifold",
	}, { t("M^{n}") }, { condition = helper.in_math }),
	-- }}}
	-- n-dimensional, simply connected riemannian space forms {{{2
	s(
		{
			trig = [[(?<=\\)([ehs])\1]],
			regTrig = true,
			docTrig = [[\ee]],
			trigEngine = "ecma",
			snippetType = "autosnippet",
			desc = "n-dimensional, simply connected Riemannian space forms",
		},
		f(function(_, snip)
			local M = {
				["e"] = [[mathbb{E}]],
				["h"] = [[mathbb{H}]],
				["s"] = [[mathbb{S}]],
			}
			return M[snip.captures[1]] .. [[^{n}]]
		end),
		{ condition = helper.in_math }
	),
	-- }}}
	-- n-dimensional riemannian manifold {{{2
	s({
		trig = "mnf",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "n-dimensional riemannian manifold",
	}, t([[\left(M^{n},g\right)]]), { condition = helper.in_math }),
	-- }}}
	-- n-dimensional riemannian manifold {{{2
	s({
		trig = "mng",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "n-dimensional riemannian manifold",
	}, t([[\left(M^{n},\bar{g}\right)]]), { condition = helper.in_math }),
	-- }}}
	-- algebra of smooth functions {{{2
	s(
		{
			trig = "asf",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "algebra of smooth functions",
		},
		fmta(
			[[
	    C^{\infty}{\left(<>\right)}
	    ]],
			{ i(1, [[M^{n}]]) }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- module of smooth vector fields {{{2
	s(
		{
			trig = "mvf",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "module of smooth vector fields",
		},
		fmta(
			[[
	    \mathfrak{X}^{\infty}{\left(<>\right)}
	    ]],
			{ i(1, [[M^{n}]]) }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- \partial_{} {{{2
	s(
		{
			trig = "6x([ijkl])",
			regTrig = true,
			docTrig = "6xi",
			trigEngine = "ecma",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = [[\partial_{}]],
		},
		fmta(
			[[
	    \X{<>}
	    ]],
			{ l(l.CAPTURE1, {}) }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- dx_{} {{{2
	s(
		{
			trig = "dx([ijkl])",
			regTrig = true,
			docTrig = "dxi",
			trigEngine = "ecma",
			snippetType = "autosnippet",
			desc = [[dx^{}]],
		},
		fmta(
			[[
	    dx^{<>}
	    ]],
			{ l(l.CAPTURE1, {}) }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- nabla 1 {{{2
	s({
		trig = "nb1",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = [[\nabla]],
	}, t([[\nabla]]), { condition = helper.in_math }),
	-- }}}
	-- nabla 2 {{{2
	s({
		trig = "nb2",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = [[\nabla^{2}]],
	}, t([[\nabla^{2}]]), { condition = helper.in_math }),
	-- }}}
	-- (flat) riemannian metric {{{2
	s(
		{
			trig = "frm",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "(flat) riemannian metric",
		},
		fmta(
			[[
	    \flatMetr{<>}{<>}
	    ]],
			{ i(1, "X"), i(2, "Y") }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- (flat) riemannian connection {{{2
	s(
		{
			trig = "flc",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "(flat) riemannian connection",
		},
		fmta(
			[[
	    \flatConn{<>}{<>}
	    ]],
			{ i(1, "X"), i(2, "Y") }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- riemannian metric {{{2
	s(
		{
			trig = "grm",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "riemannian metric",
		},
		fmta(
			[[
	    \riemMetr{<>}{<>}
	    ]],
			{ i(1, "X"), i(2, "Y") }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- riemannian connection {{{2
	s(
		{
			trig = "glc",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "riemannian connection",
		},
		fmta(
			[[
	    \riemConn{<>}{<>}
	    ]],
			{ i(1, "X"), i(2, "Y") }
		),
		{ condition = helper.in_math }
	),
	-- }}}
	-- modeling factor {{{2
	s({
		trig = "d0mf",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "modeling factor",
	}, t([[\mathcal{G}_{0}]]), { condition = helper.in_math }),
	-- }}}
	-- first covariant derivative of the modeling factor {{{2
	s({
		trig = "d1mf",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "first covariant derivative of the modeling factor",
	}, t([[\mathcal{G}_{1}]]), { condition = helper.in_math }),
	-- }}}
	-- second covariant derivative of the modeling factor {{{2
	s({
		trig = "d2mf",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "second covariant derivative of the modeling factor",
	}, t([[\mathcal{G}_{2}]]), { condition = helper.in_math }),
	-- }}}
	-- }}}
	-- citation, bibliography {{{1
	-- cite {{{2
	s(
		{
			trig = [[\cite]],
			snippetType = "autosnippet",
			desc = "cite",
		},
		fmta(
			[[
      ~\cite{<>}<>
      ]],
			{ i(1), i(0) }
		),
		{ condition = helper.in_text }
	),
	-- }}}
	-- }}}
}
