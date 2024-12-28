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
						"s",
						"sn",
						"t",
						"i",
						"f",
						"c",
						"d",
						"r",
						"l",
						"rep",
						"p",
						"m",
						"n",
						"dl",
						"fmt",
						"fmta",
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
M.FORMATTER = {
	"black",
	"isort",
	"jq",
	"stylua",
}
-- }}}

return M
