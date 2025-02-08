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
-- Vim Keymap Set {{{
G.VKS = function(mod, lhs, rhs, opt)
	vim.keymap.set(mod, lhs, rhs, opt)
end
-- }}}
-- Nvim Create Augroup {{{
G.NCA = function(gr_name, gr_opts)
	vim.api.nvim_create_augroup(gr_name, gr_opts)
end
-- }}}

return G
