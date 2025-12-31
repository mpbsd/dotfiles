return {
	"Julian/lean.nvim",
	enabled = false,
	event = {
		"BufReadPre *.lean",
		"BufNewFile *.lean",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		mappings = true,
	},
}
