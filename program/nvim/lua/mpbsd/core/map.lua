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
	-- Move cursor to the window on the left {{{
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
	-- Move cursor to the window on the right {{{
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
	-- Change window orientation {{{
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
	-- Change window orientation {{{
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
}

MAP(KEY)
