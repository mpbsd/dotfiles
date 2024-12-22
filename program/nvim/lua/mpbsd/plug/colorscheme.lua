return {
	"catppuccin/nvim",
	name = "catppucin",
	priority = 1000,
	config = function()
		vim.cmd("colorscheme catppuccin-mocha")
	end,
}
