return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		local toggleterm = require("toggleterm")

		toggleterm.setup({
			direction = "float",
			open_mapping = [[<C-\>]],
			close_on_exit = true,
		})
	end,
}
