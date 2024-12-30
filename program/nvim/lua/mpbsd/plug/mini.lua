return {
	"echasnovski/mini.nvim",
	version = "*",
	enabled = true,
	config = function()
		local ai = require("mini.ai")
		local surround = require("mini.surround")
		local align = require("mini.align")

		ai.setup()
		surround.setup()
		align.setup()
	end,
}
