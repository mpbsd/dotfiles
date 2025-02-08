local NCA = require("mpbsd.core.globals").NCA

vim.api.nvim_create_autocmd("TextYankPost", {
	group = NCA("highlight_on_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
	desc = "Highlight whatever has just been yanked",
})

vim.api.nvim_create_autocmd("FileType", {
	group = NCA("marker_foldmethod", { clear = true }),
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
	group = NCA("remove_trailing_spaces", { clear = true }),
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
	group = NCA("LaTeXing", { clear = true }),
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
	group = NCA("CSV", { clear = true }),
	pattern = { "csv" },
	command = [[set nowrap]],
	desc = "Prepare Neovim for an awesome CSV experience",
})
