local globals = require('mpbsd.core.opts.globals')

-- mappings {{{
local mappings = {
  {
    mod = 'n',
    lhs = '<leader>erc',
    rhs = ':edit ~/.config/nvim/init.lua<cr>',
    opt = {
      noremap = true,
      silent = false,
      desc = 'edit vimrc',
    },
  },
  {
    mod = 'n',
    lhs = '<leader>eac',
    rhs = ':edit ~/.config/nvim/lua/mpbsd/core/opts/autocmd.lua<cr>',
    opt = {
      noremap = true,
      silent = false,
      desc = 'edit autocommands',
    },
  },
  {
    mod = 'n',
    lhs = '<leader>egb',
    rhs = ':edit ~/.config/nvim/lua/mpbsd/core/opts/globals.lua<cr>',
    opt = {
      noremap = true,
      silent = false,
      desc = 'edit global resources',
    },
  },
  {
    mod = 'n',
    lhs = '<leader>ekm',
    rhs = ':edit ~/.config/nvim/lua/mpbsd/core/opts/keymaps.lua<cr>',
    opt = {
      noremap = true,
      silent = false,
      desc = 'edit keymaps',
    },
  },
  {
    mod = 'n',
    lhs = '<leader>eop',
    rhs = ':edit ~/.config/nvim/lua/mpbsd/core/opts/general.lua<cr>',
    opt = {
      noremap = true,
      silent = false,
      desc = 'edit options',
    },
  },
  {
    mod = 'n',
    lhs = '<leader>epg',
    rhs = ':edit ~/.config/nvim/lua/mpbsd/plug/pkgs/<cr>',
    opt = {
      noremap = true,
      silent = false,
      desc = 'edit plugins',
    },
  },
  {
    mod = 'n',
    lhs = '<leader>esn',
    rhs = ':edit ~/.config/nvim/lua/mpbsd/snip/<cr>',
    opt = {
      noremap = true,
      silent = false,
      desc = 'edit snippets',
    },
  },
  {
    mod = 'n',
    lhs = '<leader>src',
    rhs = ':source ~/.config/nvim/init.lua<cr>',
    opt = {
      noremap = true,
      silent = false,
      desc = 'source vimrc',
    },
  },
  {
    mod = 'n',
    lhs = '<leader>sac',
    rhs = ':source ~/.config/nvim/lua/mpbsd/core/opts/autocmd.lua<cr>',
    opt = {
      noremap = true,
      silent = false,
      desc = 'source autocommands',
    },
  },
  {
    mod = 'n',
    lhs = '<leader>sgb',
    rhs = ':source ~/.config/nvim/lua/mpbsd/core/opts/globals.lua<cr>',
    opt = {
      noremap = true,
      silent = false,
      desc = 'source global resources',
    },
  },
  {
    mod = 'n',
    lhs = '<leader>skm',
    rhs = ':source ~/.config/nvim/lua/mpbsd/core/opts/keymaps.lua<cr>',
    opt = {
      noremap = true,
      silent = false,
      desc = 'source keymaps',
    },
  },
  {
    mod = 'n',
    lhs = '<leader>sop',
    rhs = ':source ~/.config/nvim/lua/mpbsd/core/opts/general.lua<cr>',
    opt = {
      noremap = true,
      silent = false,
      desc = 'source options',
    },
  },
  {
    mod = 'n',
    lhs = '<leader>spg',
    rhs = ':source ~/.config/nvim/lua/mpbsd/plug/<cr>',
    opt = {
      noremap = true,
      silent = false,
      desc = 'source plugins',
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
    lhs = '<leader>gs',
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
}
-- }}}

globals.nvim_set_keymaps(mappings)
