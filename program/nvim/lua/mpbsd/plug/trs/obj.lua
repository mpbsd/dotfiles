return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	enabled = true,
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter",
			config = true,
		},
	},
	config = function()
		local ts_config = require("nvim-treesitter.configs")
		local ts_repeat = require("nvim-treesitter.textobjects.repeatable_move")
		local MAP = require("mpbsd.core.glb").MAP

		ts_config.setup({
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = {
							query = "@class.inner",
							desc = "Select inner part of a class region",
						},
						["as"] = {
							query = "@local.scope",
							query_group = "locals",
							desc = "Select language scope",
						},
					},
					selection_modes = {
						["@parameter.outer"] = "v",
						["@function.outer"] = "V",
						["@class.outer"] = "<C-V>",
					},
					include_surrounding_whitespace = true,
				},
			},
			swap = {
				enable = true,
				swap_next = {
					["<leader>a"] = "@parameter.inner",
				},
				swap_previous = {
					["<leader>A"] = "@parameter.inner",
				},
			},
			move = {
				enable = true,
				set_jumps = true,
				goto_next_start = {
					["]m"] = "@function.outer",
					["]]"] = {
						query = "@class.outer",
						desc = "Next class start",
					},
					["]o"] = {
						query = {
							"@loop.inner",
							"@loop.outer",
						},
					},
					["]s"] = {
						query = "@local.scope",
						query_group = "locals",
						desc = "Next scope",
					},
					["]z"] = {
						query = "@fold",
						query_group = "folds",
						desc = "Next fold",
					},
				},
				goto_next_end = {
					["]M"] = "@function.outer",
					["]["] = "@class.outer",
				},
				goto_previous_start = {
					["[m"] = "@function.outer",
					["[["] = "@class.outer",
				},
				goto_previous_end = {
					["[M"] = "@function.outer",
					["[]"] = "@class.outer",
				},
				goto_next = {
					["]d"] = "@conditional.outer",
				},
				goto_previous = {
					["[d"] = "@conditional.outer",
				},
			},
		})

		local KEY = {
			-- {{{
			{
				mod = { "n", "x", "o" },
				lhs = ";",
				rhs = ts_repeat.repeat_last_move_next,
				opt = {
					noremap = true,
					silent = true,
				},
			},
			-- }}}
			-- {{{
			{
				mod = { "n", "x", "o" },
				lhs = ",",
				rhs = ts_repeat.repeat_last_move_previous,
				opt = {
					noremap = true,
					silent = true,
				},
			},
			-- }}}
			-- {{{
			{
				mod = { "n", "x", "o" },
				lhs = "f",
				rhs = ts_repeat.builtin_f_expr,
				opt = {
					noremap = true,
					silent = true,
					expr = true,
				},
			},
			-- }}}
			-- {{{
			{
				mod = { "n", "x", "o" },
				lhs = "F",
				rhs = ts_repeat.builtin_F_expr,
				opt = {
					noremap = true,
					silent = true,
					expr = true,
				},
			},
			-- }}}
			-- {{{
			{
				mod = { "n", "x", "o" },
				lhs = "t",
				rhs = ts_repeat.builtin_t_expr,
				opt = {
					noremap = true,
					silent = true,
					expr = true,
				},
			},
			-- }}}
			-- {{{
			{
				mod = { "n", "x", "o" },
				lhs = "T",
				rhs = ts_repeat.builtin_T_expr,
				opt = {
					noremap = true,
					silent = true,
					expr = true,
				},
			},
			-- }}}
		}

		MAP(KEY)
	end,
}
