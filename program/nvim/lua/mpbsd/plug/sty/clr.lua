return {
	{
		"craftzdog/solarized-osaka.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("solarized-osaka")
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("carbonfox")
		end,
	},
	{
		"folke/tokyonight.nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("kanagawa-wave")
		end,
	},
}
