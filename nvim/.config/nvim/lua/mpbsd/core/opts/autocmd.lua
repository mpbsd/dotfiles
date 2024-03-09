local globals = require('mpbsd.core.opts.globals')

-- autocmds {{{
local autocmds = {
  {
    event = { 'BufWritePre' },
    opts = {
      pattern = { '*.c', '*.h', '*.lua', '*.py', '*.sh', '*.tex' },
      command = [[1,$s/\s\+$//ge]],
      group = 'remove_trailing_spaces',
    },
  },
  {
    event = { 'FileType' },
    opts = {
      pattern = { 'c', 'h', 'lua', 'python', 'sh', 'tex' },
      command = 'setlocal foldmethod=marker',
      group = 'marker_foldmethod',
    },
  },
}
-- }}}

globals.nvim_create_autocmd(autocmds)
