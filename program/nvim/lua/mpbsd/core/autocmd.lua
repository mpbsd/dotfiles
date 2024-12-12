vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("MarkerFoldmethod", { clear = true }),
	pattern = {
		"lua",
		"python",
		"sh",
	},
	command = [[setlocal foldmethod=marker]],
})
