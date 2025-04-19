return {
	"williamboman/mason.nvim",
	-- dependencies = {
	-- 	"WhoIsSethDaniel/mason-tool-installer.nvim",
	-- },
	config = function()
		local mason = require("mason")
		-- local mason_tool_installer = require("mason-tool-installer")
		-- local LSP = require("mpbsd.core.glb").LSP
		-- local FMT = require("mpbsd.core.glb").FMT

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- mason_tool_installer.setup({ ensure_installed = FMT })
	end,
}
