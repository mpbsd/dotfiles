local M = {}

-- Language Servers {{{
M.LSP = {
	bashls = {},
	clangd = {},
	jsonls = {},
	lua_ls = {
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
				diagnostics = {
					globals = {
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
					},
					disable = { "missing-fields" },
				},
			},
		},
	},
	pyright = {},
	texlab = {},
}
-- }}}
-- Formatters {{{
M.FMT = {
	"black",
	"isort",
	"jq",
	"stylua",
}
-- }}}

return M
