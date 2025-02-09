-- set_lsp_keybindings {{{1
local set_lsp_keybindings = function(event)
	local telescope = require("telescope.builtin")
	local MAP = require("mpbsd.core.glb").MAP

	local KEY = {
		-- [C]ode [A]ction {{{2
		{
			mod = { "n", "x" },
			lhs = "<leader>ca",
			rhs = vim.lsp.buf.code_action,
			opt = {
				buffer = event.buf,
				noremap = true,
				silent = true,
				desc = "[C]ode [A]ction",
			},
		},
		-- }}}
		-- [D]ocument [S]ymbols {{{2
		{
			mod = "n",
			lhs = "<leader>ds",
			rhs = telescope.lsp_document_symbols,
			opt = {
				buffer = event.buf,
				noremap = true,
				silent = true,
				desc = "[D]ocument [S]ymbols",
			},
		},
		-- }}}
		-- [G]oto [D]eclaration {{{2
		{
			mod = "n",
			lhs = "gD",
			rhs = vim.lsp.buf.declaration,
			opt = {
				buffer = event.buf,
				noremap = true,
				silent = true,
				desc = "[G]oto [D]eclaration",
			},
		},
		-- }}}
		-- [G]oto [D]efinition {{{2
		{
			mod = "n",
			lhs = "gd",
			rhs = telescope.lsp_definitions,
			opt = {
				buffer = event.buf,
				noremap = true,
				silent = true,
				desc = "[G]oto [D]efinition",
			},
		},
		-- }}}
		-- [G]oto [I]mplementation {{{2
		{
			mod = "n",
			lhs = "gI",
			rhs = telescope.lsp_implementations,
			opt = {
				buffer = event.buf,
				noremap = true,
				silent = true,
				desc = "[G]oto [I]mplementation",
			},
		},
		-- }}}
		-- [G]oto [R]eferences {{{2
		{
			mod = "n",
			lhs = "gr",
			rhs = telescope.lsp_references,
			opt = {
				buffer = event.buf,
				noremap = true,
				silent = true,
				desc = "[G]oto [R]eferences",
			},
		},
		-- }}}
		-- [R]e[n]ame {{{2
		{
			mod = "n",
			lhs = "<leader>rn",
			rhs = vim.lsp.buf.rename,
			opt = {
				buffer = event.buf,
				noremap = true,
				silent = true,
				desc = "[R]e[N]ame",
			},
		},
		-- }}}
		-- [T]ype [D]efinition {{{2
		{
			mod = "n",
			lhs = "td",
			rhs = telescope.lsp_type_definitions,
			opt = {
				buffer = event.buf,
				noremap = true,
				silent = true,
				desc = "[T]ype [D]efinition",
			},
		},
		-- }}}
		-- [W]orkspace [S]ymbols {{{2
		{
			mod = "n",
			lhs = "<leader>ws",
			rhs = telescope.lsp_dynamic_workspace_symbols,
			opt = {
				buffer = event.buf,
				noremap = true,
				silent = true,
				desc = "[W]orkspace [S]ymbols",
			},
		},
		-- }}}
	}

	if vim.lsp.get_client_by_id(event.data.client_id) then
		MAP(KEY)
	end
end
-- }}}

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDniel/mason-tool-installer.nvim",
		{
			"j-hui/fidget.nvim",
			opts = {},
		},
		"hrsh7th/cmp-nvim-lsp",
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{
						path = "${3rd}/luv/library",
						words = { "vim%.uv" },
					},
				},
			},
		},
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local mason_lspconfig = require("mason-lspconfig")

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = set_lsp_keybindings,
			desc = "LSP Keybindings",
		})

		mason_lspconfig.setup({
			handlers = {
				function(server_name)
					local lspconfig = require("lspconfig")
					local LSP = require("mpbsd.core.glb").LSP
					local lsp = LSP[server_name] or {}
					local capabilities = vim.tbl_deep_extend(
						"force",
						vim.lsp.protocol.make_client_capabilities(),
						cmp_nvim_lsp.default_capabilities()
					)

					lsp.capabilities = vim.tbl_deep_extend("force", {}, capabilities, lsp.capabilities or {})
					lspconfig[server_name].setup(lsp)
				end,
			},
		})
	end,
}
