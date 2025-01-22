-- utils {{{1
local utils = {
	-- in_math {{{2
	in_math = function()
		return vim.fn["vimtex#syntax#in_mathzone"]() == 1
	end,
	-- }}}
	-- in_text {{{2
	in_text = function()
		return vim.fn["vimtex#syntax#in_mathzone"]() ~= 1
	end,
	-- }}}
	-- greek_letter {{{2
	greek_letter = function(_, snip)
		local alphabet = {
			a = [[\alpha]],
			b = [[\beta]],
			g = [[\gamma]],
			d = [[\delta]],
			e = [[\epsilon]],
			z = [[\zeta]],
			h = [[\eta]],
			j = [[\theta]],
			i = [[\iota]],
			k = [[\kappa]],
			l = [[\lambda]],
			m = [[\mu]],
			n = [[\nu]],
			x = [[\xi]],
			p = [[\pi]],
			r = [[\rho]],
			s = [[\sigma]],
			t = [[\tau]],
			u = [[\upsilon]],
			f = [[\phi]],
			c = [[\chi]],
			y = [[\psi]],
			w = [[\omega]],
			G = [[\Gamma]],
			D = [[\Delta]],
			J = [[\Theta]],
			L = [[\Lambda]],
			X = [[\Xi]],
			P = [[\Pi]],
			S = [[\Sigma]],
			U = [[\Upsilon]],
			F = [[\Phi]],
			Y = [[\Psi]],
			W = [[\Omega]],
			ve = [[\varepsilon]],
			vj = [[\vartheta]],
			vp = [[\varpi]],
			vs = [[\varsigma]],
			vr = [[\varrho]],
			vf = [[\varphi]],
		}
		return alphabet[snip.captures[1]]
	end,
	-- }}}
	-- dynamic_matrix {{{
	dynamic_matrix = function(_, snip)
		local rows = tonumber(snip.captures[2])
		local cols = tonumber(snip.captures[3])
		local node = {}
		local indx = 1
		for j = 1, rows do
			for k = 1, cols do
				table.insert(node, r(indx, "x_{" .. tostring(j) .. tostring(k) .. "}", i(1)))
				if k < cols then
					table.insert(node, t([[ & ]]))
				else
					if j < rows then
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
-- }}}

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
      \usepakcage[english]{babel}
      \usepackage{amsmath}
      \usepackage{amssymb}
      \usepackage{amsthm}
      \usepackage{enumerate}
      \usepackage{graphicx}
      \usepackage{float}
      \usepackage{hyperref}
      \usepackage{interval}
      \usepackage{mathtools}
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
      \end{document}
      ]],
			{
				t(""),
				t(""),
				c(1, { t(""), i(nil, "% commands?") }),
				t(""),
				t(""),
				t(""),
				i(0),
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
	-- package {{{
	s(
		{
			trig = "pkg",
			snippetType = "autosnippet",
			desc = "package",
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
	-- mid range selection of packages {{{
	s(
		{
			trig = "mid",
			snippetType = "autosnippet",
			desc = "mid range selection of package",
		},
		t({
			[[\usepackage[T1]{fontenc}]],
			[[\usepakcage[english]{babel}]],
			[[\usepackage{amsmath}]],
			[[\usepackage{amssymb}]],
			[[\usepackage{amsthm}]],
			[[\usepackage{enumerate}]],
			[[\usepackage{graphicx}]],
			[[\usepackage{float}]],
			[[\usepackage{hyperref}]],
			[[\usepackage{interval}]],
			[[\usepackage{mathtools}]],
			[[\usepackage[table]{xcolor}]],
		}),
		{ condition = conds.line_begin }
	),
	-- }}}
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
			{ condition = utils.in_text }
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
			{ condition = utils.in_text }
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
			{ condition = utils.in_text }
		)
	),
	-- }}}
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
			trig = "pro",
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
	-- dynamic_matrix {{{
	s(
		{
			trig = [[([bBpvV])mat(\d+)(\d+)]],
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
			trig = "$$",
			snippetType = "autosnippet",
			desc = "inline math mode",
		},
		fmta(
			[[
      $ <> $
      ]],
			{ i(1) }
		),
		{ condition = utils.in_text }
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
			{ i(1) },
			{ condition = utils.in_text }
		)
	),
	-- }}}
	-- less than or equal to {{{
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- greater than or equal to {{{
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- sum {{{
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- product {{{
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- fraction {{{
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- su(b|per)script {{{
	s(
		{
			trig = [[([_^])\1]],
			regTrig = true,
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- inverse {{{
	s({
		trig = [[(?<=\^)-1]],
		regTrig = true,
		trigEngine = "ecma",
		snippetType = "autosnippet",
		desc = "inverse",
	}, t([[{-1}]]), { condition = utils.in_math }),
	-- }}}
	-- function action {{{
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- function declaration {{{
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- function reference {{{
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- trigonometric, exponential, logarithmic and hyperbolic functions {{{
	s(
		{
			trig = [[\\(a?(cos|sin|tan|sec|csc|cot)h?|exp|log|ln)]],
			regTrig = true,
			trigEngine = "ecma",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = "trigonometric, exponential, logarithmic and hyperbolic functions",
		},
		fmta(
			[[
      <>{\left(<>\right)}
      ]],
			{
				f(function(_, snip)
					local fn = {
						["cos"] = [[\cos]],
						["sin"] = [[\sin]],
						["tan"] = [[\tan]],
						["acos"] = [[\arccos]],
						["asin"] = [[\arcsin]],
						["atan"] = [[\arctan]],
						["sec"] = [[\sec]],
						["csc"] = [[\csc]],
						["cot"] = [[\cot]],
						["asec"] = [[\arcsec]],
						["acsc"] = [[\arccsc]],
						["acot"] = [[\arccot]],
						["cosh"] = [[\cosh]],
						["sinh"] = [[\sinh]],
						["tanh"] = [[\tanh]],
						["acosh"] = [[\arccosh]],
						["asinh"] = [[\arcsinh]],
						["atanh"] = [[\arctanh]],
						["sech"] = [[\sech]],
						["csch"] = [[\csch]],
						["coth"] = [[\coth]],
						["asech"] = [[\arcsech]],
						["acsch"] = [[\arccsch]],
						["acoth"] = [[\arccoth]],
						["exp"] = [[e^]],
						["log"] = [[\log]],
						["ln"] = [[\ln]],
					}
					return fn[snip.captures[1]]
				end),
				i(2, "x"),
			}
		),
		{ condition = utils.in_math }
	),
	-- }}}
	-- numerical sets {{{
	s(
		{
			trig = [[(?<=\\)([nzqrc])\1]],
			regTrig = true,
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- for all {{{
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- there exists {{{
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- belongs to {{{
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- owns {{{
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- subset {{{
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- subset {{{
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- cup {{{
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- bigcup {{{
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- cap {{{
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- bigcap {{{
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- times {{{
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- cartesian product {{{
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- absolute complement {{{
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- relative complement {{{
	s({
		trig = [[;rc]],
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "relative complement",
	}, t([[^{c}]]), { condition = utils.in_math }),
	-- }}}
	-- empty set {{{
	s({
		trig = [[;OO]],
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "empty set",
	}, t([[\emptyset]]), { condition = utils.in_math }),
	-- }}}
	-- infinity {{{
	s({
		trig = [[oo]],
		regTrig = true,
		trigEngine = "ecma",
		snippetType = "autosnippet",
		desc = "infinity",
	}, t([[\infty]]), { condition = utils.in_math }),
	-- }}}
	-- greek letters {{{
	s({
		trig = "`([abgdezhjiklmnxprstufcyw]|[GDJLXPSUFYW]|v[ejpsrf])",
		regTrig = true,
		trigEngine = "ecma",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "greek letters",
	}, f(utils.greek_letter), { condition = utils.in_math }),
	-- }}}
	-- custom commands for differential geometry {{{
	s(
		{
			trig = "_conformal",
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
		{ condition = conds.line_begin }
	),
	-- }}}
	-- n-dimensional riemannian manifold {{{
	s({
		trig = "mnf",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "n-dimensional riemannian manifold",
	}, t([[\left(M^{n},g\right)]]), { condition = utils.in_math }),
	-- }}}
	-- n-dimensional riemannian manifold {{{
	s({
		trig = "mng",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "n-dimensional riemannian manifold",
	}, t([[\left(M^{n},\bar{g}\right)]]), { condition = utils.in_math }),
	-- }}}
	-- algebra of smooth functions {{{
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- module of smooth vector fields {{{
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- \partial_{} {{{
	s(
		{
			trig = "6xi",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = [[\partial_{}]],
		},
		fmta(
			[[
      \X{<>}
      ]],
			{ i(1, "i") }
		),
		{ condition = utils.in_math }
	),
	-- }}}
	-- dx_{} {{{
	s(
		{
			trig = "dxi",
			wordTrig = false,
			snippetType = "autosnippet",
			desc = [[dx_{}]],
		},
		fmta(
			[[
      dx_{<>}
      ]],
			{ i(1, "i") }
		),
		{ condition = utils.in_math }
	),
	-- }}}
	-- (flat) riemannian metric {{{
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- (flat) riemannian connection {{{
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- riemannian metric {{{
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- riemannian connection {{{
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- derivative of the modeling factor {{{
	s({
		trig = "dmf",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "derivative of the modeling factor",
	}, t([[\mathcal{G}]]), { condition = utils.in_math }),
	-- }}}
}
