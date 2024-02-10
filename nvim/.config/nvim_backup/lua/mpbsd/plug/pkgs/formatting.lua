return {
  'stevearc/conform.nvim',
  lazy = true,
  event = { 'BufWritePre' },
  config = function()
    local conform = require('conform')
    local globals = require('mpbsd.core.opts.globals')
    conform.setup(
      {
        formatters_by_ft = {
          python = { 'isort', 'black' },
        },
      }
    )
    globals.vim_keymap_set(
      {
        {
          mod = { 'n', 'v' },
          lhs = '<leader>fc',
          rhs = function()
            conform.format(
              {
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
              }
            )
          end
        },
      }
    )
  end
}
