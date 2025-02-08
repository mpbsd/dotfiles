-- MAP {{{1
local MAP = require("mpbsd.core.globals").MAP
-- }}}
-- KEY {{{1
local KEY = {
	-- Ex mode {{{2
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
	-- [W]rite {{{2
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
	-- [Q]uit {{{2
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
	-- [W]rite [A]ll {{{2
	{
		mod = "n",
		lhs = "<Leader>wa",
		rhs = "<Cmd>wa<CR>",
		opt = {
			noremap = true,
			silent = true,
			desc = "[W]rite [A]ll",
		},
	},
	-- }}}
	-- [Q]uit [A]ll {{{2
	{
		mod = "n",
		lhs = "<Leader>qa",
		rhs = "<Cmd>qa<CR>",
		opt = {
			noremap = true,
			silent = true,
			desc = "[Q]uit [A]ll",
		},
	},
	-- }}}
	-- ZZ {{{2
	{
		mod = "n",
		lhs = "<Leader>zz",
		rhs = "ZZ<CR>",
		opt = {
			noremap = true,
			silent = true,
			desc = "ZZ",
		},
	},
	-- }}}
	-- ZQ {{{2
	{
		mod = "n",
		lhs = "<Leader>zq",
		rhs = "ZQ<CR>",
		opt = {
			noremap = true,
			silent = true,
			desc = "ZQ",
		},
	},
	-- }}}
	-- [S]plit | {{{2
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
	-- [S]plit - {{{2
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
	-- Move cursor to the window on the left {{{2
	{

		mod = "n",
		lhs = "<C-H>",
		rhs = "<C-W><C-H>",
		opt = {
			noremap = true,
			silent = true,
			desc = "Move cursor to the window on the left",
		},
	},
	-- }}}
	-- Move cursor to the window below {{{2
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
	-- Move cursor to the window above {{{2
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
	-- Move cursor to the window on the right {{{2
	{

		mod = "n",
		lhs = "<C-L>",
		rhs = "<C-W><C-L>",
		opt = {
			noremap = true,
			silent = true,
			desc = "Move cursor to the window on the right",
		},
	},
	-- }}}
	-- Change window orientation {{{2
	{
		mod = "n",
		lhs = "<Leader>th",
		rhs = "<C-W>t<C-W>H",
		opt = {
			noremap = true,
			silent = true,
			desc = "Change window orientation",
		},
	},
	-- }}}
	-- Change window orientation {{{2
	{
		mod = "n",
		lhs = "<Leader>tk",
		rhs = "<C-W>t<C-W>K",
		opt = {
			noremap = true,
			silent = true,
			desc = "Change window orientation",
		},
	},
	-- }}}
	-- [L]a[Z]y {{{2
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
	-- [M]a[S]on {{{2
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
	-- Fugitive {{{2
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
	-- [C]heck [H]ealth {{{2
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
	-- [C]amel [C]ase {{{2
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
	-- [T]o [U]pper case {{{2
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
	-- [T]o [L]ower case {{{2
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
}
-- }}}

MAP(KEY)
