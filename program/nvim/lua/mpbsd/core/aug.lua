vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_on_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
	desc = "Highlight yanked text",
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("marker_foldmethod", { clear = true }),
	pattern = {
		"c",
		"h",
		"lua",
		"python",
		"sh",
		"tex",
	},
	command = [[setlocal foldmethod=marker]],
	desc = "Marker foldmethod",
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("remove_trailing_spaces", { clear = true }),
	pattern = {
		"c",
		"h",
		"lua",
		"python",
		"sh",
	},
	command = [[%s/\s\+$//e]],
	desc = "Trim white spaces",
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("LaTeXing", { clear = true }),
	pattern = { "tex" },
	callback = function()
		local MAP = require("mpbsd.core.glb").MAP

		vim.o.spell = true
		vim.g.textwidth = 256

		local KEY = {
			-- LaTeX: Make draft {{{
			{
				mod = "n",
				lhs = "<LocalLeader>d",
				rhs = "<Cmd>Make draft<CR>",
				opt = {
					noremap = true,
					silent = true,
					desc = "LaTeX: Make draft",
				},
			},
			-- }}}
			-- LaTeX: Make final {{{
			{
				mod = "n",
				lhs = "<LocalLeader>f",
				rhs = "<Cmd>Make final<CR>",
				opt = {
					noremap = true,
					silent = true,
					desc = "LaTeX: Make final",
				},
			},
			-- }}}
			-- LaTeX: Make clean {{{
			{
				mod = "n",
				lhs = "<LocalLeader>c",
				rhs = "<Cmd>Make clean<CR>",
				opt = {
					noremap = true,
					silent = true,
					desc = "LaTeX: Make clean",
				},
			},
			-- }}}
		}

		MAP(KEY)
	end,
	desc = "LaTeX",
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("CSV", { clear = true }),
	pattern = { "csv" },
	command = [[set nowrap]],
	desc = "CSV",
})
