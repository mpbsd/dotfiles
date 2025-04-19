return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git",
	},
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
			diagnostics = {
				globals = {
					-- awesomewm
					"awesome",
					"client",
					"root",
					"screen",
					-- luasnips
					"ls",
					"s",
					"sn",
					"isn",
					"t",
					"i",
					"f",
					"c",
					"d",
					"r",
					"events",
					"ai",
					"extras",
					"l",
					"rep",
					"p",
					"m",
					"n",
					"dl",
					"fmt",
					"fmta",
					"conds",
					"postfix",
					"types",
					"parse",
					"ms",
					"k",
					-- neovim
					-- "vim",
				},
				disable = {
					"missing-fields",
				},
			},
		},
	},
}
