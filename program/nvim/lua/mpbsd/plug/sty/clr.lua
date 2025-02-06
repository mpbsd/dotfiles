return {
	{
		"rebelot/kanagawa.nvim",
		enable = true,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("kanagawa-wave")
		end,
	},
}
