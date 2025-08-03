return {
	"saghen/blink.cmp",
	event = { "VimEnter" },
	version = "1.*",
	dependencies = {
		"L3MON4D3/LuaSnip",
	},
	opts = {
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			documentation = {
				auto_show = false,
				auto_show_delay_ms = 500,
			},
		},
		cmdline = {
			keymap = {
				preset = "default",
				["<C-e>"] = false,
			},
			completion = {
				ghost_text = {
					enabled = true,
				},
			},
		},
		fuzzy = {
			implementation = "rust",
		},
		keymap = {
			preset = "default",
		},
		signature = {
			enabled = true,
		},
		snippets = {
			preset = "luasnip",
		},
		sources = {
			default = {
				"buffer",
				"cmdline",
				"lsp",
				"omni",
				"path",
				"snippets",
			},
		},
	},
}
