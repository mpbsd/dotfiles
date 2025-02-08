local G = {}

-- Language Servers {{{
G.LSP = {
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
G.FMT = {
	"black",
	"isort",
	"jq",
	"stylua",
}
-- }}}
-- keymap {{{
G.MAP = function(mod, lhs, rhs, dcr)
	local opt = { noremap = true, silent = true, desc = dcr }
	vim.keymap.set(mod, lhs, rhs, opt)
end
-- }}}

return G
