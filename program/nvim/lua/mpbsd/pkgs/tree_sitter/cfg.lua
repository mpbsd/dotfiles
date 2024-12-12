return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "bash",
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "latex",
      },

      sync_install = false,

      auto_install = false,

      ignore_install = { "javascript" },

      -- parser_install_dir = "/some/path/to/store/parsers",

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

  end
}
