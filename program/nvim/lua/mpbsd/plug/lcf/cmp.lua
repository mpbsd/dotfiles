return {
	"saghen/blink.cmp",
	event = { "VimEnter" },
	version = "1.*",
	dependencies = {
		"L3MON4D3/LuaSnip",
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
				"buffer",
				"cmdline",
				"lsp",
				"omni",
				"path",
				"snippets",
			},
		},
		snippets = {
			preset = "luasnip",
		},
		fuzzy = {
			implementation = "rust",
		},
		signature = {
			enabled = true,
		},
	},
}
