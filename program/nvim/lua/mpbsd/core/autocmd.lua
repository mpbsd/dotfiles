local augroup = function(group_name)
	return vim.api.nvim_create_augroup("mpbsd_" .. group_name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_on_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
	desc = "Highlight whatever has just been yanked",
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup("marker_foldmethod"),
	pattern = {
		"c",
		"h",
		"lua",
		"python",
		"sh",
		"tex",
	},
	command = [[setlocal foldmethod=marker]],
	desc = "Set foldmethod to marker for these file types",
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup("remove_trailing_spaces"),
	pattern = {
		"c",
		"h",
		"lua",
		"python",
		"sh",
	},
	command = [[%s/\s\+$//e]],
	desc = "Remove trailing white spaces for these file types",
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup("LaTeXing"),
	pattern = { "tex" },
	callback = function()
		vim.o.spell = true
		vim.g.textwidth = 256
		vim.keymap.set("n", "<LocalLeader>d", ":Make draft<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<LocalLeader>f", ":Make final<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<LocalLeader>c", ":Make clean<CR>", { noremap = true, silent = true })
	end,
	desc = "LaTeX editing made easier",
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup("CSV"),
	pattern = { "csv" },
	command = [[set nowrap]],
	desc = "Prepare Neovim for an awesome CSV experience",
})
