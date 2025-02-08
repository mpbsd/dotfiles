return {
	"neovim/nvim-lspconfig",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
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
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local LSP = require("mpbsd.core.globals").LSP

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local telescope = require("telescope.builtin")

				local map = function(mode, keys, func, desc)
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("n", "gd", telescope.lsp_definitions, "[G]oto [D]efinition")
				map("n", "gr", telescope.lsp_references, "[G]oto [R]eferences")
				map("n", "gI", telescope.lsp_implementations, "[G]oto [I]mplementation")
				map("n", "<leader>D", telescope.lsp_type_definitions, "Type [D]efinition")
				map("n", "<leader>ds", telescope.lsp_document_symbols, "[D]ocument [S]ymbols")
				map("n", "<leader>ws", telescope.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
				map("n", "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				map("n", "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
					local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
						end,
					})
				end

				if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
					map("n", "<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, "[T]oggle Inlay [H]ints")
				end
			end,
		})

		-- Change diagnostic symbols in the sign column (gutter)
		-- if vim.g.have_nerd_font then
		-- 	local signs = { ERROR = "", WARN = "", INFO = "", HINT = "" }
		-- 	local diagnostic_signs = {}
		-- 	for type, icon in pairs(signs) do
		-- 		diagnostic_signs[vim.diagnostic.severity[type]] = icon
		-- 	end
		-- 	vim.diagnostic.config({ signs = { text = diagnostic_signs } })
		-- end

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())

		mason_lspconfig.setup({
			handlers = {
				function(server_name)
					local server = LSP[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					lspconfig[server_name].setup(server)
				end,
			},
		})
	end,
}
