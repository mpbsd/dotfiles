vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("MarkerFoldmethod", { clear = true }),
	pattern = {
		"c",
		"h",
		"lua",
		"python",
		"sh",
	},
	command = [[setlocal foldmethod=marker]],
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("RemoveTrailingSpaces", { clear = true }),
	pattern = {
		"c",
		"h",
		"lua",
		"python",
		"sh",
	},
	command = [[%s/\s\+$//e]],
})
