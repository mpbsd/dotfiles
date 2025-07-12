return {
	-- MAP {{{
	---@param KEY table
	MAP = function(KEY)
		for _, kmp in pairs(KEY) do
			local mod = kmp["mod"]
			local lhs = kmp["lhs"]
			local rhs = kmp["rhs"]
			local opt = kmp["opt"]
			vim.keymap.set(mod, lhs, rhs, opt)
		end
	end,
	-- }}}
	-- luasnip utils {{{1
	utils = {
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
	},
	-- }}}
}
