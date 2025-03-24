return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		vim.g.vimtex_compiler_enabled = false
		vim.g.vimtex_imaps_enabled = false
		vim.g.vimtex_indent_enabled = false
		vim.g.vimtex_format_enable = false
	end,
}
