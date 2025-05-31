local MAP = require("mpbsd.core.glb").MAP

local KEY = {
	-- Ex mode {{{
	{
		mod = "n",
		lhs = "<Leader>;",
		rhs = ":",
		opt = {
			noremap = true,
			silent = false,
			desc = "Ex mode",
		},
	},
	-- }}}
	-- [W]rite {{{
	{
		mod = "n",
		lhs = "<LocalLeader>w",
		rhs = "<Cmd>w<CR>",
		opt = {
			noremap = true,
			silent = true,
			desc = "[W]rite",
		},
	},
	-- }}}
	-- [Q]uit {{{
	{
		mod = "n",
		lhs = "<LocalLeader>q",
		rhs = "<Cmd>q<CR>",
		opt = {
			noremap = true,
			silent = true,
			desc = "[Q]uit",
		},
	},
	-- }}}
	-- [S]plit | {{{
	{
		mod = "n",
		lhs = [[<Leader>s\]],
		rhs = "<Cmd>vs<CR>",
		opt = {
			noremap = true,
			silent = true,
			desc = "[S]plit |",
		},
	},
	-- }}}
	-- [S]plit - {{{
	{
		mod = "n",
		lhs = [[<Leader>s-]],
		rhs = "<Cmd>sp<CR>",
		opt = {
			noremap = true,
			silent = true,
			desc = "[S]plit -",
		},
	},
	-- }}}
	-- Move cursor to the left window {{{
	{

		mod = "n",
		lhs = "<C-H>",
		rhs = "<C-W><C-H>",
		opt = {
			noremap = true,
			silent = true,
			desc = "Move cursor to the left window",
		},
	},
	-- }}}
	-- Move cursor to the window below {{{
	{
		mod = "n",
		lhs = "<C-J>",
		rhs = "<C-W><C-J>",
		opt = {
			noremap = true,
			silent = true,
			desc = "Move cursor to the window below",
		},
	},
	-- }}}
	-- Move cursor to the window above {{{
	{
		mod = "n",
		lhs = "<C-K>",
		rhs = "<C-W><C-K>",
		opt = {
			noremap = true,
			silent = true,
			desc = "Move cursor to the window above",
		},
	},
	-- }}}
	-- Move cursor to the right window {{{
	{

		mod = "n",
		lhs = "<C-L>",
		rhs = "<C-W><C-L>",
		opt = {
			noremap = true,
			silent = true,
			desc = "Move cursor to the right window",
		},
	},
	-- }}}
	-- Show the next matched string at the center of screen {{{
	{
		mod = "n",
		lhs = "n",
		rhs = "nzz",
		opt = {
			noremap = true,
			silent = true,
			desc = "Show the next matched string at the center of screen",
		},
	},
	-- }}}
	-- Show the previous matched string at the center of screen {{{
	{
		mod = "n",
		lhs = "N",
		rhs = "Nzz",
		opt = {
			noremap = true,
			silent = true,
			desc = "Show the previous matched string at the center of screen",
		},
	},
	-- }}}
	-- nohls {{{
	{
		mod = "n",
		lhs = "<BS>",
		rhs = "<Cmd>nohls<CR>",
		opt = {
			noremap = true,
			silent = true,
			desc = "nohls",
		},
	},
	-- }}}
	-- hsplit -> vsplit {{{
	{
		mod = "n",
		lhs = "<Leader>wth",
		rhs = "<C-W>t<C-W>H",
		opt = {
			noremap = true,
			silent = true,
			desc = "hsplit -> vsplit",
		},
	},
	-- }}}
	-- vsplit -> hsplit {{{
	{
		mod = "n",
		lhs = "<Leader>wtk",
		rhs = "<C-W>t<C-W>K",
		opt = {
			noremap = true,
			silent = true,
			desc = "vsplit -> hsplit",
		},
	},
	-- }}}
	-- [L]a[Z]y {{{
	{
		mod = "n",
		lhs = "<Leader>lz",
		rhs = "<Cmd>Lazy<CR>",
		opt = {
			noremap = true,
			silent = true,
			desc = "[L]a[Z]y",
		},
	},
	-- }}}
	-- [M]a[S]on {{{
	{
		mod = "n",
		lhs = "<Leader>ms",
		rhs = "<Cmd>Mason<CR>",
		opt = {
			noremap = true,
			silent = true,
			desc = "[M]a[S]on",
		},
	},
	-- }}}
	-- Fugitive {{{
	{
		mod = "n",
		lhs = "<Leader>0g",
		rhs = "<Cmd>0G<CR>",
		opt = {
			noremap = true,
			silent = true,
			desc = "Fugitive",
		},
	},
	-- }}}
	-- [C]heck [H]ealth {{{
	{
		mod = "n",
		lhs = "<LocalLeader>ch",
		rhs = "<Cmd>checkhealth<CR>",
		opt = {
			noremap = true,
			silent = true,
			desc = "[C]heck [H]ealth",
		},
	},
	-- }}}
	-- [C]amel [C]ase {{{
	{
		mod = "i",
		lhs = "<LocalLeader>cc",
		rhs = "<esc>mmb~`ma",
		opt = {
			noremap = true,
			silent = true,
			desc = "[C]amel [C]ase",
		},
	},
	-- }}}
	-- [T]o [U]pper case {{{
	{
		mod = "i",
		lhs = "<LocalLeader>tu",
		rhs = "<esc>mmbgUiw`ma",
		opt = {
			noremap = true,
			silent = true,
			desc = "[T]o [U]pper case",
		},
	},
	-- }}}
	-- [T]o [L]ower case {{{
	{
		mod = "i",
		lhs = "<LocalLeader>tl",
		rhs = "<esc>mmbguiw`ma",
		opt = {
			noremap = true,
			silent = true,
			desc = "[T]o [L]ower case",
		},
	},
	-- }}}
	-- [D]e[C]ode buffer {{{
	{
		mod = "n",
		lhs = "<LocalLeader>dc",
		rhs = function()
			local EQUIVALENCE_TABLE = {
				["à"] = "a",
				["á"] = "a",
				["â"] = "a",
				["ã"] = "a",
				["ç"] = "c",
				["é"] = "e",
				["ê"] = "e",
				["í"] = "i",
				["ó"] = "o",
				["ô"] = "o",
				["õ"] = "o",
				["ú"] = "u",
			}
			local pos = vim.fn.getpos(".")
			local reg = vim.fn.getreg("/")
			for lhs, rhs in pairs(EQUIVALENCE_TABLE) do
				local substitution_cmd = [[%s/]] .. lhs .. [[/]] .. rhs .. [[/ge]]
				vim.cmd(substitution_cmd)
			end
			vim.fn.setpos(".", pos)
			vim.fn.setreg("/", reg)
		end,
		opt = {
			noremap = true,
			silent = true,
			desc = "[D]e[C]ode buffer",
		},
	},
	-- }}}
	-- [R]remove [T]railing spaces from the current buffer {{{
	{
		mod = "n",
		lhs = "<LocalLeader>tm",
		rhs = function()
			local pos = vim.fn.getpos(".")
			local reg = vim.fn.getreg("/")
			vim.cmd([[%s/\s\+$//e]])
			vim.fn.setpos(".", pos)
			vim.fn.setreg("/", reg)
		end,
		opt = {
			noremap = true,
			silent = true,
			desc = "[R]emove [T]railing spaces from current buffer",
		},
	},
	-- }}}
	-- generate a random alphanumeric pass phrase {{{
	{
		mod = "n",
		lhs = "<LocalLeader>uid",
		rhs = function()
			local hex = [[-1r!python3 -c 'import uuid; print(uuid.uuid4().hex)']]
			vim.cmd(hex)
		end,
		opt = {
			noremap = true,
			silent = true,
			desc = "generate a random alphanumeric pass phrase",
		},
	},
	-- }}}
	-- [i]nstall grammars for [t]ree-[s]itter {{{
	{
		mod = "n",
		lhs = "<LocalLeader>its",
		rhs = function()
			local CMD = ":TSInstall <trs>"
			local TRS = {
				"bash",
				"bibtex",
				"c",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"vim",
				"vimdoc",
				"python",
				"ruby",
				"query",
			}
			for _, trs in pairs(TRS) do
				local cmd = CMD:gsub("<trs>", trs)
				vim.cmd(cmd)
			end
		end,
		opt = {
			noremap = true,
			silent = false,
			desc = "install tree-sitter grammar",
		},
	},
	-- }}}
}

MAP(KEY)
