-- clear snippets {{{1
require("luasnip.session.snippet_collection").clear_snippets("tex")
-- }}}
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
	-- dynamic_matrix {{{2
	dynamic_matrix = function(_, snip)
		local rows = tonumber(snip.captures[2])
		local cols = tonumber(snip.captures[3])
		local node = {}
		local indx = 1
		for j = 1, rows do
			for k = 1, cols do
				table.insert(node, i(indx, "x_{" .. tostring(j) .. tostring(k) .. "}"))
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
	-- delimiters {{{2
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
			{ condition = utils.line_begin }
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
			{ condition = utils.line_begin }
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
			{ condition = utils.line_begin }
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
			{ condition = utils.line_begin }
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
        \(<>\)
      ]],
			{ i(1) }
		)
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
		)
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
	-- function definition {{{
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
			trig = [[(?<=\\)(a?(cos|sin|tan|sec|csc|cot)h?|exp|log|ln)]],
			regTrig = true,
			trigEngine = "ecma",
			wordTrig = false,
			desc = "trigonometric, exponential, logarithmic and hyperbolic functions",
		},
		fmta(
			[[
	    <>{\left(<>\right)}
	    ]],
			{
				f(function(_, snip)
					local fn = {
						["cos"] = [[cos]],
						["sin"] = [[sin]],
						["tan"] = [[tan]],
						["acos"] = [[arccos]],
						["asin"] = [[arcsin]],
						["atan"] = [[arctan]],
						["sec"] = [[sec]],
						["csc"] = [[csc]],
						["cot"] = [[cot]],
						["asec"] = [[arcsec]],
						["acsc"] = [[arccsc]],
						["acot"] = [[arccot]],
						["cosh"] = [[cosh]],
						["sinh"] = [[sinh]],
						["tanh"] = [[tanh]],
						["acosh"] = [[arccosh]],
						["asinh"] = [[arcsinh]],
						["atanh"] = [[arctanh]],
						["sech"] = [[sech]],
						["csch"] = [[csch]],
						["coth"] = [[coth]],
						["asech"] = [[arcsech]],
						["acsch"] = [[arccsch]],
						["acoth"] = [[arccoth]],
						["exp"] = [[e^]],
						["log"] = [[log]],
						["ln"] = [[ln]],
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
	-- polynomial rings {{{
	s(
		{
			trig = [[(?<=\\)([zqrc])([xt])]],
			regTrig = true,
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
		wordTrig = true,
		snippetType = "autosnippet",
		desc = "infinity",
	}, t([[\infty]]), { condition = utils.in_math }),
	-- }}}
	-- dots {{{
	s({
		trig = [[(?<!\\)([cdlv]dots)]],
		regTrig = true,
		trigEngine = "ecma",
		snippetType = "autosnippet",
		desc = "dots",
	}, l([[\]] .. l.CAPTURE1), { condition = conds.in_math }),
	-- }}}
	-- custom commands for group theory {{{
	s(
		{
			trig = "_group",
			snippetType = "autosnippet",
			desc = "custom commands for group theory",
		},
		t({
			[[\DeclarePairedDelimiter{\order}{\lvert}{\rvert}]],
			[[\newcommand{\subgroup}{\leqslant}]],
			[[\newcommand{\normalsubgroup}{\trianglelefteqslant}]],
		}),
		{ condition = conds.line_begin }
	),
	-- }}}
	-- subgroup {{{
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
		{ condition = conds.in_math }
	),
	-- }}}
	-- normal subgroup {{{
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
		{ condition = conds.in_math }
	),
	-- }}}
	-- lagrange's theorem {{{
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
		{ condition = conds.in_math }
	),
	-- }}}
	-- galois group {{{
	s(
		{
			trig = [[gg([a-z])([a-z])]],
			regTrig = true,
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
		{ condition = utils.in_math }
	),
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
	-- bar, dot, hat, overline and vector {{{
	s(
		{
			trig = [[(\S+)\.(bar|d{1,3}ot|hat|overline|vec)]],
			regTrig = true,
			trigEngine = "ecma",
			snippetType = "autosnippet",
			desc = "bar, dot, hat, overline and vector",
		},
		f(function(_, snip)
			return [[\]] .. snip.captures[2] .. [[{]] .. snip.captures[1] .. [[}]]
		end),
		{ condition = conds.in_math }
	),
	-- }}}
	-- absolute value, norm {{{
	s(
		{
			trig = [[(\S+)\.(abs|norm|order)]],
			regTrig = true,
			trigEngine = "ecma",
			snippetType = "autosnippet",
			desc = "absolute value, norm, order",
		},
		f(function(_, snip)
			return [[\]] .. snip.captures[2] .. [[{]] .. snip.captures[1] .. [[}]]
		end),
		{ condition = conds.in_math }
	),
	-- }}}
	-- custom commands for differential geometry {{{
	s(
		{
			trig = "_dgeom",
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
	-- n-dimensional differentiable manifold {{{
	s({
		trig = "Mn",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "n-dimensional differentiable manifold",
	}, { t("M^{n}") }, { condition = conds.in_math }),
	-- }}}
	-- n-dimensional, simply connected riemannian space forms {{{
	s(
		{
			trig = [[(?<=\\)([ehs])\1]],
			regTrig = true,
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
		{ condition = conds.in_math }
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
			trig = "6x([ijkl])",
			regTrig = true,
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- dx_{} {{{
	s(
		{
			trig = "dx([ijkl])",
			regTrig = true,
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
		{ condition = utils.in_math }
	),
	-- }}}
	-- nabla 1 {{{
	s({
		trig = "nb1",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = [[\nabla]],
	}, t([[\nabla]]), { condition = utils.in_math }),
	-- }}}
	-- nabla 2 {{{
	s({
		trig = "nb2",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = [[\nabla^{2}]],
	}, t([[\nabla^{2}]]), { condition = utils.in_math }),
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
	-- modeling factor {{{
	s({
		trig = "d0mf",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "modeling factor",
	}, t([[\mathcal{G}_{0}]]), { condition = utils.in_math }),
	-- }}}
	-- first covariant derivative of the modeling factor {{{
	s({
		trig = "d1mf",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "first covariant derivative of the modeling factor",
	}, t([[\mathcal{G}_{1}]]), { condition = utils.in_math }),
	-- }}}
	-- second covariant derivative of the modeling factor {{{
	s({
		trig = "d2mf",
		wordTrig = false,
		snippetType = "autosnippet",
		desc = "second covariant derivative of the modeling factor",
	}, t([[\mathcal{G}_{2}]]), { condition = utils.in_math }),
	-- }}}
	-- cite {{{
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
		{ condition = utils.in_text }
	),
	-- }}}
}
