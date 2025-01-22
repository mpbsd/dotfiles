return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		luasnip.config.set_config({
			enable_autosnippets = true,
			history = true,
			updateevents = "TextChanged,TextChangedI",
		})

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = {
				completeopt = "menu,menuone,noinsert",
			},

			mapping = cmp.mapping.preset.insert({
				["<C-N>"] = cmp.mapping.select_next_item(),
				["<C-P>"] = cmp.mapping.select_prev_item(),
				["<C-B>"] = cmp.mapping.scroll_docs(-4),
				["<C-F>"] = cmp.mapping.scroll_docs(4),
				["<C-Y>"] = cmp.mapping.confirm({ select = true }),

				["<C-Space>"] = cmp.mapping.complete(),

				["<C-L>"] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { "i", "s" }),
				["<C-H>"] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { "i", "s" }),
			}),
			sources = {
				{
					name = "lazydev",
					group_index = 0,
				},
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
			},
		})
	end,
}
