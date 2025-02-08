return {
	"stevearc/conform.nvim",
	event = { "BufReadPre" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				json = { "jq" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			format_after_save = {
				lsp_fallback = true,
			},
		})
	end,
}
