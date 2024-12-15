local M = {}

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

M.FORMATTER = {
	"stylua",
	"black",
	"isort",
}

return M
