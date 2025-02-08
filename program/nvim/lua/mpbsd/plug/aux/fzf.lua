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
		local VKS = require("mpbsd.core.globals").VKS

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

		local cfg_nvim = function()
			builtin.find_files({ cwd = "~/.config/nvim/lua/mpbsd" })
		end

		local KMP = {
			-- [F]ind [F]iles {{{
			{
				mod = "n",
				lhs = "<Leader>ff",
				rhs = builtin.find_files,
				dcr = "[F]ind [F]iles",
			},
			-- }}}
			-- [L]ive [G]rep {{{
			{
				mod = "n",
				lhs = "<Leader>lg",
				rhs = builtin.live_grep,
				dcr = "[L]ive [G]rep",
			},
			-- }}}
			-- [F]ind [B]uffers {{{
			{
				mod = "n",
				lhs = "<Leader>fb",
				rhs = builtin.buffers,
				dcr = "[F]ind [B]uffers",
			},
			-- }}}
			-- [F]ind [H]elp {{{
			{
				mod = "n",
				lhs = "<Leader>fh",
				rhs = builtin.help_tags,
				dcr = "[F]ind [H]elp",
			},
			-- }}}
			-- [M]an [P]age {{{
			{
				mod = "n",
				lhs = "<Leader>mp",
				rhs = builtin.man_pages,
				dcr = "[M]an [P]age",
			},
			-- }}}
			-- [C]onfigure [N]eovim {{{
			{
				mod = "n",
				lhs = "<Leader>cn",
				rhs = cfg_nvim,
				dcr = "[E]dit [N]eovim",
			},
			-- }}}
		}

		local OPT = function(dcr)
			return { noremap = true, silent = true, desc = dcr }
		end

		for _, kmp in pairs(KMP) do
			local mod = kmp["mod"]
			local lhs = kmp["lhs"]
			local rhs = kmp["rhs"]
			local dcr = kmp["dcr"]
			local opt = OPT(dcr)
			VKS(mod, lhs, rhs, opt)
		end
	end,
}
