return {
	"Julian/lean.nvim",
	enabled = true,
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
