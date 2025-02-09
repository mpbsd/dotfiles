local OPT = {
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
		startofline = true,
		undofile = true,
		clipboard = "unnamedplus",
		lazyredraw = true,
		showmode = false,
	},
	-- }}}
}

for ctg, _ in pairs(OPT) do
	for lhs, rhs in pairs(OPT[ctg]) do
		if ctg == "G" then
			vim.g[lhs] = rhs
		elseif ctg == "O" then
			vim.opt[lhs] = rhs
		end
	end
end
