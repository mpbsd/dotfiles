local M = require("mpbsd.core.globals").VKS
local K = {
	-- Ex mode {{{
	{
		mod = "n",
		lhs = "<Leader>;",
		rhs = ":",
		dcr = "Ex mode",
	},
	-- }}}
	-- [W]rite {{{
	{
		mod = "n",
		lhs = "<LocalLeader>w",
		rhs = "<Cmd>w<CR>",
		dcr = "[W]rite",
	},
	-- }}}
	-- [Q]uit {{{
	{
		mod = "n",
		lhs = "<LocalLeader>q",
		rhs = "<Cmd>q<CR>",
		dcr = "[Q]uit",
	},
	-- }}}
	-- [W]rite [A]ll {{{
	{
		mod = "n",
		lhs = "<Leader>wa",
		rhs = "<Cmd>wa<CR>",
		dcr = "[W]rite [A]ll",
	},
	-- }}}
	-- [Q]uit [A]ll {{{
	{
		mod = "n",
		lhs = "<Leader>qa",
		rhs = "<Cmd>qa<CR>",
		dcr = "[Q]uit [A]ll",
	},
	-- }}}
	-- ZZ {{{
	{
		mod = "n",
		lhs = "<Leader>zz",
		rhs = "ZZ<CR>",
		dcr = "ZZ",
	},
	-- }}}
	-- ZQ {{{
	{
		mod = "n",
		lhs = "<Leader>zq",
		rhs = "ZQ<CR>",
		dcr = "ZQ",
	},
	-- }}}
	-- [S]plit | {{{
	{
		mod = "n",
		lhs = [[<Leader>s\]],
		rhs = "<Cmd>vs<CR>",
		dcr = "[S]plit |",
	},
	-- }}}
	-- [S]plit - {{{
	{
		mod = "n",
		lhs = [[<Leader>s-]],
		rhs = "<Cmd>sp<CR>",
		dcr = "[S]plit -",
	},
	-- }}}
	-- Move cursor to the window on the left {{{
	{

		mod = "n",
		lhs = "<C-H>",
		rhs = "<C-W><C-H>",
		dcr = "Move cursor to the window on the left",
	},
	-- }}}
	-- Move cursor to the window below {{{
	{
		mod = "n",
		lhs = "<C-J>",
		rhs = "<C-W><C-J>",
		dcr = "Move cursor to the window below",
	},
	-- }}}
	-- Move cursor to the window above {{{
	{
		mod = "n",
		lhs = "<C-K>",
		rhs = "<C-W><C-K>",
		dcr = "Move cursor to the window above",
	},
	-- }}}
	-- Move cursor to the window on the right {{{
	{

		mod = "n",
		lhs = "<C-L>",
		rhs = "<C-W><C-L>",
		dcr = "Move cursor to the window on the right",
	},
	-- }}}
	-- Change window orientation {{{
	{
		mod = "n",
		lhs = "<Leader>wth",
		rhs = "<C-W>t<C-W>H",
		dcr = "Change window orientation",
	},
	-- }}}
	-- Change window orientation {{{
	{
		mod = "n",
		lhs = "<Leader>wtk",
		rhs = "<C-W>t<C-W>K",
		dcr = "Change window orientation",
	},
	-- }}}
	-- [L]a[Z]y {{{
	{
		mod = "n",
		lhs = "<Leader>lz",
		rhs = "<Cmd>Lazy<CR>",
		dcr = "[L]a[Z]y",
	},
	-- }}}
	-- [M]a[S]on {{{
	{
		mod = "n",
		lhs = "<Leader>ms",
		rhs = "<Cmd>Mason<CR>",
		dcr = "[M]a[S]on",
	},
	-- }}}
	-- Fugitive: 0Git {{{
	{
		mod = "n",
		lhs = "<Leader>0g",
		rhs = "<Cmd>0G<CR>",
		dcr = "Fugitive: 0Git",
	},
	-- }}}
	-- [C]heck [H]ealth {{{
	{
		mod = "n",
		lhs = "<LocalLeader>ch",
		rhs = "<Cmd>checkhealth<CR>",
		dcr = "[C]heck [H]ealth",
	},
	-- }}}
	-- [C]amel [C]ase {{{
	{
		mod = "i",
		lhs = "<LocalLeader>cc",
		rhs = "<esc>mmb~`ma",
		dcr = "[C]amel [C]ase",
	},
	-- }}}
	-- [T]o [U]pper case {{{
	{
		mod = "i",
		lhs = "<LocalLeader>tu",
		rhs = "<esc>mmbgUiw`ma",
		dcr = "[T]o [U]pper case",
	},
	-- }}}
	-- [T]o [L]ower case {{{
	{
		mod = "i",
		lhs = "<LocalLeader>tl",
		rhs = "<esc>mmbguiw`ma",
		dcr = "[T]o [L]ower case",
	},
	-- }}}
}

local opt = { noremap = true, silent = true, desc = dcr }

for _, keymap in pairs(K) do
	local mod = keymap["mod"]
	local lhs = keymap["lhs"]
	local rhs = keymap["rhs"]
	local dcr = keymap["dcr"]
	M(mod, lhs, rhs, opt)
end
