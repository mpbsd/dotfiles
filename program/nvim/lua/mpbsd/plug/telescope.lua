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
		local telescope_builtin = require("telescope.builtin")
		local telescope_actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = telescope_actions.move_selection_next,
						["<C-k>"] = telescope_actions.move_selection_previous,
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

		vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags, { noremap = true, silent = true })

		vim.keymap.set("n", "<leader>mp", telescope_builtin.man_pages, { noremap = true, silent = true })

		vim.keymap.set("n", "<leader>rc", function()
			telescope_builtin.find_files({ cwd = "~/.config/nvim/lua/mpbsd" })
		end, { noremap = true, silent = true })
	end,
}
