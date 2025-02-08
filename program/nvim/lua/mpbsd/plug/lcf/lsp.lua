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

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local telescope = require("telescope.builtin")
				local VKS = require("mpbsd.core.globals").VKS
				local NCA = require("mpbsd.core.globals").NCA

				local toggle_inlay_hint = function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({
						bufnr = event.buf,
					}))
				end

				local K = {
					-- [G]oto [D]efinition {{{
					gd = {
						mod = "n",
						lhs = "<leader>gd",
						rhs = telescope.lsp_definitions,
						dcr = "[G]oto [D]efinition",
					},
					-- }}}
					-- [G]oto [R]eferences {{{
					gr = {
						mod = "n",
						lhs = "<leader>gr",
						rhs = telescope.lsp_references,
						dcr = "[G]oto [R]eferences",
					},
					-- }}}
					-- [G]oto [I]mplementation {{{
					gI = {
						mod = "n",
						lhs = "<leader>gI",
						rhs = telescope.lsp_implementations,
						dcr = "[G]oto [I]mplementation",
					},
					-- }}}
					-- [T]ype [D]efinition {{{
					td = {
						mod = "n",
						lhs = "<leader>td",
						rhs = telescope.lsp_type_definitions,
						dcr = "[T]ype [D]efinition",
					},
					-- }}}
					-- [D]ocument [S]ymbols {{{
					ds = {
						mod = "n",
						lhs = "<leader>ds",
						rhs = telescope.lsp_document_symbols,
						dcr = "[D]ocument [S]ymbols",
					},
					-- }}}
					-- [W]orkspace [S]ymbols {{{
					ws = {
						mod = "n",
						lhs = "<leader>ws",
						rhs = telescope.lsp_dynamic_workspace_symbols,
						dcr = "[W]orkspace [S]ymbols",
					},
					-- }}}
					-- [R]e[n]ame {{{
					rn = {
						mod = "n",
						lhs = "<leader>rn",
						rhs = vim.lsp.buf.rename,
						dcr = "[R]e[N]ame",
					},
					-- }}}
					-- [C]ode [A]ction {{{
					ca = {
						mod = { "n", "x" },
						lhs = "<leader>ca",
						rhs = vim.lsp.buf.code_action,
						dcr = "[C]ode [A]ction",
					},
					-- }}}
					-- [G]oto [D]eclaration {{{
					gD = {
						mod = "n",
						lhs = "<leader>gD",
						rhs = vim.lsp.buf.declaration,
						dcr = "[G]oto [D]eclaration",
					},
					-- }}}
					-- [T]oggle Inlay [H]ints {{{
					th = {
						mod = "n",
						lhs = "<leader>th",
						rhs = toggle_inlay_hint,
						dcr = "[T]oggle Inlay [H]ints",
					},
					-- }}}
				}

				local opt = {
					buffer = event.buf,
					noremap = true,
					silent = true,
				}

				local evt_id = event.data.client_id
				local lsp_id = vim.lsp.get_client_by_id(evt_id)

				if lsp_id then
					for label, keymap in pairs(K) do
						local mod = keymap["mod"]
						local lhs = keymap["lhs"]
						local rhs = keymap["rhs"]
						local dcr = keymap["dcr"]

						opt["desc"] = "LSP: " .. dcr

						if label == "th" then
							local lay_hint = vim.lsp.protocol.Methods.textDocument_inlayHint
							local has_hint = lsp_id.supports_method(lay_hint)
							if has_hint then
								VKS(mod, lhs, rhs, opt)
							end
						else
							VKS(mod, lhs, rhs, opt)
						end
					end

					local doc_hl = vim.lsp.protocol.Methods.textDocument_documentHighlight
					local sup_hl = lsp_id.supports_method(doc_hl)

					if sup_hl then
						local lsp_highlight = NCA("lsp-highlight", { clear = false })

						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = lsp_highlight,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = lsp_highlight,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = NCA("lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({
									buffer = event2.buf,
									group = "lsp-highlight",
								})
							end,
						})
					end
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
					local LSP = require("mpbsd.core.globals").LSP
					local lsp = LSP[server_name] or {}
					lsp.capabilities = vim.tbl_deep_extend("force", {}, capabilities, lsp.capabilities or {})
					lspconfig[server_name].setup(lsp)
				end,
			},
		})
	end,
}
