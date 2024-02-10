local globals = require('mpbsd.core.opts.globals')

globals.vim_create_autocmd({
  {
    evt = { 'FileType' },
    ptn = {
      'c',
      'h',
      'lua',
      'markdown',
      'python',
      'sh',
      'tex',
    },
    cmd = 'setlocal foldmethod=marker',
    grp = 'marker_foldmethod',
  },
})
