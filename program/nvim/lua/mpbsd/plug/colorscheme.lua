return {
	{
		"folke/tokyonight.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		opts = {
			style = "night",
		},
		config = function()
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("carbonfox")
		end,
	},
}
