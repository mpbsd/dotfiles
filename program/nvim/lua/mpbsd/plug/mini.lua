return {
	"echasnovski/mini.nvim",
	version = "*",
	enabled = true,
	config = function()
		local ai = require("mini.ai")
		local surround = require("mini.surround")

		ai.setup()
		surround.setup()
	end,
}
