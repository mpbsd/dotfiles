return {
	"stevearc/oil.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local oil = require("oil")
		local VKS = require("mpbsd.core.globals").VKS

		oil.setup({
			columns = { "icon" },
			view_options = {
				show_hidden = true,
			},
		})

		local K = {
			-- Open parent directory {{{
			{
				mod = "n",
				lhs = "-",
				rhs = "<Cmd>Oil<CR>",
				dcr = "Open parent directory",
			},
			-- }}}
		}

		local OPT = function(dcr)
			return { noremap = true, silent = true, desc = dcr }
		end

		for _, keymap in pairs(K) do
			local mod = keymap["mod"]
			local lhs = keymap["lhs"]
			local rhs = keymap["rhs"]
			local dcr = keymap["dcr"]
			local opt = OPT(dcr)
			VKS(mod, lhs, rhs, opt)
		end
	end,
}
