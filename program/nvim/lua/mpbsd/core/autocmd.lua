vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("hightlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
	desc = "Highlight whatever has been yanked",
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("marker-foldmethod", { clear = true }),
	pattern = {
		"c",
		"h",
		"lua",
		"python",
		"sh",
		"tex",
	},
	command = [[setlocal foldmethod=marker]],
	desc = "Set foldmethod to marker based on the filetype",
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("trailing-spaces", { clear = true }),
	pattern = {
		"c",
		"h",
		"lua",
		"python",
		"sh",
	},
	command = [[%s/\s\+$//e]],
	desc = "Remove trailing white spaces on every save based on the filetype",
})
