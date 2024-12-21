local M = {}

-- Language Servers {{{
M.LSP = {
	clangd = {},
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
-- Formatters {{{
M.FORMATTER = {
	"stylua",
	"black",
	"isort",
}
-- }}}

return M
