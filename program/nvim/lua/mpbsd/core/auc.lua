vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_on_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
	desc = "Highlight yanked text",
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("mpbsd_fdm", { clear = true }),
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
	group = vim.api.nvim_create_augroup("rm_trailing_spaces", { clear = true }),
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
	group = vim.api.nvim_create_augroup("edit_latex_files", { clear = true }),
	pattern = { "tex" },
	callback = function()
		local MAP = require("mpbsd.core.glb").MAP

		vim.o.spell = true

		local KEY = {
			-- LaTeX: edit article {{{
			{
				mod = "n",
				lhs = "<LocalLeader>ea",
				rhs = "<Cmd>Earticle<CR>",
				opt = {
					noremap = true,
					silent = true,
					desc = "LaTeX: edit article",
				},
			},
			-- }}}
			-- LaTeX: edit introduction {{{
			{
				mod = "n",
				lhs = "<LocalLeader>ei",
				rhs = "<Cmd>Earticle<CR>",
				opt = {
					noremap = true,
					silent = true,
					desc = "LaTeX: edit introduction",
				},
			},
			-- }}}
			-- LaTeX: edit results {{{
			{
				mod = "n",
				lhs = "<LocalLeader>ea",
				rhs = "<Cmd>Eresults<CR>",
				opt = {
					noremap = true,
					silent = true,
					desc = "LaTeX: edit results",
				},
			},
			-- }}}
			-- LaTeX: edit examples {{{
			{
				mod = "n",
				lhs = "<LocalLeader>ea",
				rhs = "<Cmd>Eexamples<CR>",
				opt = {
					noremap = true,
					silent = true,
					desc = "LaTeX: edit examples",
				},
			},
			-- }}}
			-- LaTeX: edit proofs {{{
			{
				mod = "n",
				lhs = "<LocalLeader>ea",
				rhs = "<Cmd>Eproofs<CR>",
				opt = {
					noremap = true,
					silent = true,
					desc = "LaTeX: edit proofs",
				},
			},
			-- }}}
			-- LaTeX: Make clean {{{
			{
				mod = "n",
				lhs = "<LocalLeader>mc",
				rhs = "<Cmd>Make clean<CR>",
				opt = {
					noremap = true,
					silent = true,
					desc = "LaTeX: Make clean",
				},
			},
			-- }}}
			-- LaTeX: Make draft {{{
			{
				mod = "n",
				lhs = "<LocalLeader>md",
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
				lhs = "<LocalLeader>mf",
				rhs = "<Cmd>Make final<CR>",
				opt = {
					noremap = true,
					silent = true,
					desc = "LaTeX: Make final",
				},
			},
			-- }}}
		}

		MAP(KEY)
	end,
	desc = "LaTeX",
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("edit_csv_files", { clear = true }),
	pattern = { "csv" },
	command = [[set nowrap]],
	desc = "CSV",
})
