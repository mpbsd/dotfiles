local globals = require('mpbsd.core.opts.globals')

-- autocmds {{{
local autocmds = {
  {
    evt = { 'FileType' },
    ptn = { 'c', 'h', 'lua', 'python', 'sh', 'tex' },
    cmd = 'setlocal foldmethod=marker',
    grp = 'marker_foldmethod',
  },
}
-- }}}

globals.vim_create_autocmd(autocmds)
