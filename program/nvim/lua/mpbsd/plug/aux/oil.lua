return {
	"stevearc/oil.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local oil = require("oil")
		local MAP = require("mpbsd.core.glb").MAP

		oil.setup({
			columns = { "icon" },
			view_options = {
				show_hidden = true,
			},
		})

		local KEY = {
			-- Open parent directory {{{
			{
				mod = "n",
				lhs = "-",
				rhs = "<Cmd>Oil<CR>",
				opt = {
					noremap = true,
					silent = true,
					desc = "Open parent directory",
				},
			},
			-- }}}
		}

		MAP(KEY)
	end,
}
