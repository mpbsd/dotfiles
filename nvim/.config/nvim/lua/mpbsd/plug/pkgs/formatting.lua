return {
  'stevearc/conform.nvim',
  lazy = true,
  event = { 'BufWritePre' },
  config = function()
    local conform = require('conform')
    local globals = require('mpbsd.core.opts.globals')
    local options = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    }
    conform.setup(
      {
        formatters_by_ft = {
          lua = { 'stylua' },
          python = { 'isort', 'black' },
        },
        format_on_save = options,
      }
    )
    globals.vim_keymap_set(
      {
        {
          mod = { 'n', 'v' },
          lhs = '<leader>fc',
          rhs = function()
            conform.format(options)
          end
        },
      }
    )
  end
}
