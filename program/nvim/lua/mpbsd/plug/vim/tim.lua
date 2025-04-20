return {
	{
		"tpope/vim-abolish",
		init = function()
			local a_file = vim.fn.expand("~/.config/nvim/after/plugin/abbrv.vim")
			vim.g.abolish_save_file = a_file
		end,
	},
	"tpope/vim-characterize",
	"tpope/vim-dadbod",
	"tpope/vim-dispatch",
	"tpope/vim-fugitive",
	"tpope/vim-projectionist",
	"tpope/vim-repeat",
	"tpope/vim-surround",
	"tpope/vim-unimpaired",
}
