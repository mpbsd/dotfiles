return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			ensure_installed = {
				"bash",
				"bibtex",
				"c",
				"json",
				"latex",
				"lua",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
			},

			sync_install = true,

			auto_install = true,

			ignore_install = { "javascript" },

			highlight = {
				enable = true,
				disable = function(buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,

				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
