return {
	{
		"rebelot/kanagawa.nvim",
		enable = true,
		lazy = false,
		priority = 1000,
		opts = {
			style = "lotus",
		},
		config = function()
			local kanagawa = require("kanagawa")

			kanagawa.setup({
				compile = false,
				undercurl = true,
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false,
				dimInactive = false,
				terminalColors = true,
				colors = {
					palette = {},
					theme = {
						wave = {},
						lotus = {},
						dragon = {},
						all = {},
					},
				},
				overrides = function(colors)
					return {}
				end,
				theme = "wave",
				background = {
					dark = "wave",
					light = "lotus",
				},
			})

			vim.cmd.colorscheme("kanagawa")
		end,
	},
}
