return {
  'mfussenegger/nvim-lint',
  lazy = true,
  event = { 'BufWritePost' },
  config = function()
    local lint = require('lint')
    local globals = require('mpbsd.core.opts.globals')
    lint.linters_by_ft = {
      python = { 'flake8' },
    }
    globals.vim_keymap_set(
      {
        {
          mod = 'n',
          lhs = '<localleader>lc',
          rhs = lint.try_lint,
          opt = {
            desc = 'lint [c]urrent buffer',
          }
        },
      }
    )
  end
}
