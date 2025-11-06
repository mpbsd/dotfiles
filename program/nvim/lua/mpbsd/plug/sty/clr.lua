return {
	{
		"EdenEast/nightfox.nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("terafox")
		end,
	},
	{
		"folke/tokyonight.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight")
		end,
	},
}
