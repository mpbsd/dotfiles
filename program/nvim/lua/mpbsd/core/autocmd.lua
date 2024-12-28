local augroup = function(group_name)
	return vim.api.nvim_create_augroup("mpbsd_" .. group_name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_on_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
	desc = "Highlight whatever has been yanked",
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup("set_marker_foldmethod"),
	pattern = {
		"c",
		"h",
		"lua",
		"python",
		"sh",
		"tex",
	},
	command = [[setlocal foldmethod=marker]],
	desc = "Set foldmethod to marker for these filetypes",
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup("rm_trailing_spaces"),
	pattern = {
		"c",
		"h",
		"lua",
		"python",
		"sh",
	},
	command = [[%s/\s\+$//e]],
	desc = "Remove trailing white spaces for these filetypes",
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup("awesome_LaTeXing"),
	pattern = { "tex" },
	callback = function()
		vim.o.wrap = false
		vim.o.textwidth = 260
		vim.o.colorcolumn = "260"
		vim.keymap.set("n", "<leader>mk", ":make<CR>", { noremap = true, silent = true })
	end,
	desc = "Prepare Neovim for an awesome LaTeX experience",
})
