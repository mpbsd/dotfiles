local M = {}

-- Language Servers {{{
M.LSP = {
	clangd = {},
	jsonls = {},
	lua_ls = {
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
				diagnostics = { disable = { "missing-fields" } },
			},
		},
	},
	pyright = {},
	texlab = {},
}
-- }}}
-- FORMATTERS {{{
M.FORMATTER = {
	"black",
	"jq",
	"isort",
	"stylua",
}
-- }}}

return M
