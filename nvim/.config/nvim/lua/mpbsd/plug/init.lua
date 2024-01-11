local globals = require('mpbsd.core.opts.globals')
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not globals.vim_uv.fs_stat(lazypath) then
  vim.fn.system(
    {
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable',
      lazypath,
    }
  )
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup(
  {
    {
      'folke/neoconf.nvim',
      cmd = 'Neoconf'
    },
    'folke/neodev.nvim',
    'folke/which-key.nvim',
    {
      import = 'mpbsd.plug.pkgs'
    },
    {
      import = 'mpbsd.plug.pkgs.dap'
    },
    {
      import = 'mpbsd.plug.pkgs.lsp'
    },
  },
  {
    checker = {
      enabled = true,
      notify = false,
    },
    change_detection = {
      notify = false,
    },
  }
)
