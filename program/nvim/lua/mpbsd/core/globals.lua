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
				diagnostics = {
					globals = { "snippet", "text_node" },
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
