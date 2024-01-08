return {
  'mfussenegger/nvim-lint',
  lazy = true,
  event = { 'BufWritePost' },
  config = function()
    local lint = require('lint')
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    local globals = require('mpbsd.core.opts.globals')
    lint['linters_by_ft'] {
      python = { 'flake8' },
    }
    vim.api.nvim_create_autocmd(
      'BufWritePost',
      {
        callback = lint.try_lint,
        group = lint_augroup
      }
    )
    globals.vim_keymap_set(
      {
        {
          mod = 'n',
          lhs = '<leader>lc',
          rhs = lint.try_lint(),
          opt = {
            desc = '[l]int [c]urrent buffer',
          }
        },
      }
    )
  end
}
