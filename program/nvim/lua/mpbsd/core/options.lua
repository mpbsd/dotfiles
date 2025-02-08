local OPT = {
	-- C {{{
	["C"] = {
		"colorscheme default",
	},
	-- }}}
	-- G {{{
	["G"] = {
		mapleader = [[ ]],
		maplocalleader = [[,]],
		tex_flavor = "latex",
		loaded_node_provider = 0,
		loaded_perl_provider = 0,
		loaded_python3_provider = 0,
		loaded_ruby_provider = 0,
	},
	-- }}}
	-- O {{{
	["O"] = {
		tabstop = 2,
		shiftwidth = 2,
		expandtab = true,
		smartindent = true,
		number = true,
		relativenumber = true,
		ignorecase = true,
		smartcase = true,
		incsearch = true,
		cursorline = true,
		cursorcolumn = true,
		colorcolumn = "80",
		textwidth = 80,
		splitright = true,
		splitbelow = true,
		clipboard = "unnamedplus",
		spelllang = { "en_us", "pt_br", "de_de" },
		spellsuggest = { "fast", "25" },
		list = true,
		listchars = {
			eol = "↴",
			extends = ">",
			lead = ".",
			multispace = ".",
			precedes = "<",
			tab = "│ ",
			trail = "~",
		},
		showmode = false,
		startofline = true,
		undofile = true,
		completeopt = { "menu", "menuone", "noselect" },
	},
	-- }}}
}

-- set options {{{
for sec, _ in pairs(OPT) do
	if sec == "C" then
		for _, cmd in pairs(OPT[sec]) do
			vim.cmd(cmd)
		end
	else
		for lhs, rhs in pairs(OPT[sec]) do
			if sec == "G" then
				vim.g[lhs] = rhs
			elseif sec == "O" then
				vim.opt[lhs] = rhs
			end
		end
	end
end
-- }}}
