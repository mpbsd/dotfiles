return {
	-- LSP {{{1
	LSP = {
		-- bashls {{{2
		bashls = {},
		-- }}}
		-- clangd {{{2
		clangd = {},
		-- }}}
		-- jsonls {{{2
		jsonls = {},
		-- }}}
		-- lua_ls {{{2
		lua_ls = {
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
						},
						disable = { "missing-fields" },
					},
				},
			},
		},
		-- }}}
		-- pyright {{{2
		pyright = {},
		-- }}}
		-- texlab {{{2
		texlab = {},
		-- }}}
	},
	-- }}}
	-- FMT {{{1
	FMT = {
		"black",
		"isort",
		"jq",
		"stylua",
	},
	-- }}}
	-- MAP {{{1
	---@param KEY table
	MAP = function(KEY)
		for _, kmp in pairs(KEY) do
			local mod = kmp["mod"]
			local lhs = kmp["lhs"]
			local rhs = kmp["rhs"]
			local opt = kmp["opt"]
			vim.keymap.set(mod, lhs, rhs, opt)
		end
	end,
	-- }}}
}
