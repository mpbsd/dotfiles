return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-telescope/telescope-bibtex.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")
		local bibtex_actions = require("telescope-bibtex.actions")
		local MAP = require("mpbsd.core.glb").MAP

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<Esc>"] = actions.close,
						["<C-J>"] = actions.move_selection_next,
						["<C-K>"] = actions.move_selection_previous,
					},
				},
			},
			pickers = {
				find_files = {
					theme = "ivy",
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				bibtex = {
					-- Depth for the *.bib file
					depth = 1,
					-- Custom format for citation label
					custom_formats = {},
					-- Format to use for citation label.
					-- Try to match the filetype by default, or use 'plain'
					format = "",
					-- Path to global bibliographies (placed outside of the project)
					global_files = { "~/.local/share/bibliography/full.bib" },
					-- Define the search keys to use in the picker
					search_keys = { "author", "year", "title" },
					-- Template for the formatted citation
					citation_format = "{{author}} ({{year}}), {{title}}.",
					-- Only use initials for the authors first name
					citation_trim_firstname = true,
					-- Max number of authors to write in the formatted citation
					-- following authors will be replaced by "et al."
					citation_max_auth = 2,
					-- Context awareness disabled by default
					context = false,
					-- Fallback to global/directory .bib files if context not found
					-- This setting has no effect if context = false
					context_fallback = true,
					-- Wrapping in the preview window is disabled by default
					wrap = false,
					-- user defined mappings
					mappings = {
						i = {
							["<CR>"] = bibtex_actions.key_append("%s"), -- format is determined by filetype if the user has not set it explictly
							["<C-e>"] = bibtex_actions.entry_append,
							["<C-c>"] = bibtex_actions.citation_append("{{author}} ({{year}}), {{title}}."),
						},
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("bibtex")

		local KEY = {
			-- [F]ind [F]iles {{{
			{
				mod = "n",
				lhs = "<Leader>ff",
				rhs = builtin.find_files,
				opt = {
					noremap = true,
					silent = true,
					desc = "[F]ind [F]iles",
				},
			},
			-- }}}
			-- [G]it [F]iles {{{
			{
				mod = "n",
				lhs = "<Leader>gf",
				rhs = builtin.git_files,
				opt = {
					noremap = true,
					silent = true,
					desc = "[G]it [F]iles",
				},
			},
			-- }}}
			-- [L]ive [G]rep {{{
			{
				mod = "n",
				lhs = "<Leader>lg",
				rhs = builtin.live_grep,
				opt = {
					noremap = true,
					silent = true,
					desc = "[L]ive [G]rep",
				},
			},
			-- }}}
			-- [F]ind [B]uffers {{{
			{
				mod = "n",
				lhs = "<Leader>fb",
				rhs = builtin.buffers,
				opt = {
					noremap = true,
					silent = true,
					desc = "[F]ind [B]uffers",
				},
			},
			-- }}}
			-- [F]ind [H]elp {{{
			{
				mod = "n",
				lhs = "<Leader>fh",
				rhs = builtin.help_tags,
				opt = {
					noremap = true,
					silent = true,
					desc = "[F]ind [H]elp",
				},
			},
			-- }}}
			-- [M]an [P]age {{{
			{
				mod = "n",
				lhs = "<Leader>mp",
				rhs = builtin.man_pages,
				opt = {
					noremap = true,
					silent = true,
					desc = "[M]an [P]age",
				},
			},
			-- }}}
			-- [C]onfigure [N]eovim {{{
			{
				mod = "n",
				lhs = "<Leader>cn",
				rhs = function()
					builtin.find_files({ cwd = "~/.config/nvim/lua/mpbsd" })
				end,
				opt = {
					noremap = true,
					silent = true,
					desc = "[E]dit [N]eovim",
				},
			},
			-- }}}
			-- [C]onfigure [L]SP {{{
			{
				mod = "n",
				lhs = "<Leader>cl",
				rhs = function()
					builtin.find_files({ cwd = "~/.config/nvim/lsp" })
				end,
				opt = {
					noremap = true,
					silent = true,
					desc = "[E]dit [L]SP",
				},
			},
			-- }}}
			-- [C]onfigure [A]after {{{
			{
				mod = "n",
				lhs = "<Leader>fa",
				rhs = function()
					builtin.find_files({ cwd = "~/.config/nvim/after/plugin" })
				end,
				opt = {
					noremap = true,
					silent = true,
					desc = "[E]dit [A]fter",
				},
			},
			-- }}}
		}

		MAP(KEY)
	end,
}
