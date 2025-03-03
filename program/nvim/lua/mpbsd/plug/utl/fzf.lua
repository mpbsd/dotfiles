return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")
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
			},
		})

		telescope.load_extension("fzf")

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
		}

		MAP(KEY)
	end,
}
