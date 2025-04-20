return {
	"saghen/blink.cmp",
	event = { "VimEnter" },
	version = "1.*",
	dependencies = {
		"L3MON4D3/LuaSnip",
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{
						path = "${3rd}/luv/library",
						words = { "vim%.uv" },
					},
				},
			},
		},
	},
	opts = {
		keymap = {
			preset = "default",
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			documentation = {
				auto_show = false,
				auto_show_delay_ms = 500,
			},
		},
		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"lazydev",
			},
			providers = {
				lazydev = {
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},
		snippets = {
			preset = "luasnip",
		},
		fuzzy = {
			implementation = "prefer_rust_with_warning",
		},
		signature = {
			enabled = true,
		},
	},
}
