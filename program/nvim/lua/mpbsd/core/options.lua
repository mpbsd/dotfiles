local OPT = {
	-- C {{{
	["C"] = {
		colorscheme = "retrobox",
	},
	-- }}}
	-- G {{{
	["G"] = {
		mapleader = " ",
		maplocalleader = ",",
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
		spelllang = "en_us",
	},
	-- }}}
}

local setopt = function()
	for sec, _ in pairs(OPT) do
		for lhs, rhs in pairs(OPT[sec]) do
			if sec == "C" then
				vim.cmd(lhs .. " " .. rhs)
			elseif sec == "G" then
				vim.g[lhs] = rhs
			elseif sec == "O" then
				vim.o[lhs] = rhs
			end
		end
	end
end

setopt()
