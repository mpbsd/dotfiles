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
			keymaps = {
				["<C-H>"] = false,
				["<C-J>"] = false,
				["<C-K>"] = false,
				["<C-L>"] = false,
			},
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
			-- Open parent directory in floating window {{{
			{
				mod = "n",
				lhs = "<Leader>-",
				rhs = require("oil").toggle_float,
				opt = {
					noremap = true,
					silent = true,
					desc = "Open parent directory in floating window",
				},
			},
			-- }}}
		}

		MAP(KEY)
	end,
}
