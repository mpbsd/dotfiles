local globals = require('mpbsd.core.opts.globals')

-- autocmds {{{
local autocmds = {
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

globals.vim_create_autocmd(autocmds)
