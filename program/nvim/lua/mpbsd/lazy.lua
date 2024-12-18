local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	rocks = {
		enabled = false,
	},
	spec = {
		{
			import = "mpbsd.plug",
		},
		{
			import = "mpbsd.plug.language_server_protocol",
		},
		{
			import = "mpbsd.plug.tree_sitter",
		},
	},
	checker = {
		enabled = false,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
