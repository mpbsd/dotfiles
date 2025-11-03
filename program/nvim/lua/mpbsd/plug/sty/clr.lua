return {
	{
		"ellisonleao/gruvbox.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("gruvbox")
		end,
	},
	{
		"jpwol/thorn.nvim",
		enable = true,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("thorn")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("kanagawa")
		end,
	},
	{
		"shaunsingh/nord.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("nord")
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
