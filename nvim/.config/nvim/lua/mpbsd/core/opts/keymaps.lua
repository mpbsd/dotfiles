local globals = require('mpbsd.core.opts.globals')

local mappings = { -- {{{
  {
    mod = { 'n' },
    lhs = '<C-d>',
    rhs = '<C-d>zz',
    opt = {
      noremap = true,
      silent = false,
      desc = 'go down by half of a page and keep cursor centralized',
    },
  },
  {
    mod = { 'n' },
    lhs = '<C-u>',
    rhs = '<C-u>zz',
    opt = {
      noremap = true,
      silent = false,
      desc = 'go up by half of a page and keep the cursor centralized',
    },
  },
  {
    mod = { 'n', 'v' },
    lhs = '<leader>;',
    rhs = ':',
    opt = {
      noremap = true,
      silent = false,
      desc = 'get into command mode without hitting the shift key',
    },
  },
  {
    mod = 'n',
    lhs = '-',
    rhs = ':Ex<CR>',
    opt = {
      noremap = true,
      silent = false,
      desc = 'Open the current file\'s directory in Netrw',
    },
  },
  {
    mod = 'i',
    lhs = 'jj',
    rhs = '<esc>',
    opt = {
      noremap = true,
      silent = false,
      desc = 'back to normal mode from insert mode',
    },
  },
  {
    mod = 'n',
    lhs = '<c-d>',
    rhs = '<c-d>zz',
    opt = {
      noremap = true,
      silent = false,
      desc = 'go down by half of a page while keeping the cursor centralized',
    },
  },
  {
    mod = 'n',
    lhs = '<c-u>',
    rhs = '<c-u>zz',
    opt = {
      noremap = true,
      silent = false,
      desc = 'go up by half of a page while keeping the cursor centralized',
    },
  },
  {
    mod = 'n',
    lhs = '<leader>w;',
    rhs = ':w<cr>',
    opt = {
      noremap = true,
      silent = false,
      desc = 'write',
    },
  },
  {
    mod = 'n',
    lhs = '<leader>q;',
    rhs = ':q<cr>',
    opt = {
      noremap = true,
      silent = false,
      desc = 'quit',
    },
  },
  {
    mod = 'n',
    lhs = '<c-h>',
    rhs = '<c-w>h',
    opt = {
      noremap = true,
      silent = false,
      desc = 'move focus to the left window',
    },
  },
  {
    mod = 'n',
    lhs = '<c-j>',
    rhs = '<c-w>j',
    opt = {
      noremap = true,
      silent = false,
      desc = 'move focus to the window below',
    },
  },
  {
    mod = 'n',
    lhs = '<c-k>',
    rhs = '<c-w>k',
    opt = {
      noremap = true,
      silent = false,
      desc = 'move focus to the window above',
    },
  },
  {
    mod = 'n',
    lhs = '<c-l>',
    rhs = '<c-w>l',
    opt = {
      noremap = true,
      silent = false,
      desc = 'move focus to the right window',
    },
  },
  {
    mod = 'n',
    lhs = '<leader>s-',
    rhs = ':sp<cr>',
    opt = {
      noremap = true,
      silent = false,
      desc = 'split window horizontally',
    },
  },
  {
    mod = 'n',
    lhs = [[<leader>s\]],
    rhs = ':vs<cr>',
    opt = {
      noremap = true,
      silent = false,
      desc = 'split window verticaly',
    },
  },
  {
    mod = 'n',
    lhs = '<c-left>',
    rhs = '<c-w>>',
    opt = {
      noremap = true,
      silent = false,
      desc = 'increase window width',
    },
  },
  {
    mod = 'n',
    lhs = '<c-down>',
    rhs = '<c-w>-',
    opt = {
      noremap = true,
      silent = false,
      desc = 'decrease window height',
    },
  },
  {
    mod = 'n',
    lhs = '<c-up>',
    rhs = '<c-w>+',
    opt = {
      noremap = true,
      silent = false,
      desc = 'increase window height',
    },
  },
  {
    mod = 'n',
    lhs = '<c-right>',
    rhs = '<c-w><',
    opt = {
      noremap = true,
      silent = false,
      desc = 'decrease window width',
    },
  },
  {
    mod = 'n',
    lhs = '<leader>0g',
    rhs = ':0G<cr>',
    opt = {
      noremap = true,
      silent = false,
      desc = 'git status',
    },
  },
  {
    mod = 'i',
    lhs = '<localleader>tu',
    rhs = '<esc>mmbgUiw`ma',
    opt = {
      noremap = true,
      silent = false,
      desc = 'to upper case',
    },
  },
  {
    mod = 'i',
    lhs = '<localleader>tl',
    rhs = '<esc>mmbguiw`ma',
    opt = {
      noremap = true,
      silent = false,
      desc = 'to lower case',
    },
  },
  {
    mod = 'i',
    lhs = '<localleader>cc',
    rhs = '<esc>mmb~`ma',
    opt = {
      noremap = true,
      silent = false,
      desc = 'camel case',
    },
  },
  {
    mod = 'n',
    lhs = '<leader>ht',
    rhs = ':tab h ',
    opt = {
      noremap = true,
      silent = false,
      desc = 'open help in another tab',
    },
  },
  {
    mod = 'n',
    lhs = '<leader>mp',
    rhs = ':tab Man ',
    opt = {
      noremap = true,
      silent = false,
      desc = 'open man page in another tab',
    },
  },
  {
    mod = 'n',
    lhs = '<leader>cd',
    rhs = [[:%s@\<D\([aeo]s\?\)\>@d\1@g<cr>]],
    opt = {
      noremap = true,
      silent = false,
      desc = 'change the capitalization of daeos?',
    },
  },
  {
    mod = 'n',
    lhs = '<leader>eb',
    rhs = ':e ~/.local/share/references/zotero.bib<cr>',
    opt = {
      noremap = true,
      silent = false,
      desc = 'search bibliography',
    },
  },
} -- }}}

globals.nvim_set_keymaps(mappings)
