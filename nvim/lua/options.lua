-- 'autoindent'     is enabled
-- 'autoread'       is enabled
-- 'background'     defaults to "dark" (unless set automatically by the terminal/UI)
-- 'backspace'      defaults to "indent,eol,start"
-- 'backupdir'      defaults to .,~/.local/share/nvim/backup// (|xdg|), auto-created
-- 'belloff'        defaults to "all"
-- 'compatible'     is always disabled
-- 'complete'       excludes "i"
-- 'cscopeverbose'  is enabled
-- 'directory'      defaults to ~/.local/share/nvim/swap// (|xdg|), auto-created
-- 'display'        defaults to "lastline,msgsep"
-- 'encoding'       is UTF-8 (cf. 'fileencoding' for file-content encoding)
-- 'fillchars'      defaults (in effect) to "vert:│,fold:·,sep:│"
-- 'formatoptions'  defaults to "tcqj"
-- 'fsync'          is disabled
-- 'hidden'         is enabled
-- 'history'        defaults to 10000 (the maximum)
-- 'hlsearch'       is enabled
-- 'incsearch'      is enabled
-- 'joinspaces'     is disabled
-- 'langnoremap'    is enabled
-- 'langremap'      is disabled
-- 'laststatus'     defaults to 2 (statusline is always shown)
-- 'listchars'      defaults to "tab:> ,trail:-,nbsp:+"
-- 'nrformats'      defaults to "bin,hex"
-- 'ruler'          is enabled
-- 'sessionoptions' includes "unix,slash", excludes "options"
-- 'shortmess'      includes "F", excludes "S"
-- 'showcmd'        is enabled
-- 'sidescroll'     defaults to 1
-- 'smarttab'       is enabled
-- 'startofline'    is disabled
-- 'switchbuf'      defaults to "uselast"
-- 'tabpagemax'     defaults to 50
-- 'tags'           defaults to "./tags;,tags"
-- 'ttimeoutlen'    defaults to 50
-- 'ttyfast'        is always set
-- 'undodir'        defaults to ~/.local/share/nvim/undo// (|xdg|), auto-created
-- 'viewoptions'    includes "unix,slash", excludes "options"
-- 'viminfo'        includes "!"
-- 'wildmenu'       is enabled
-- 'wildoptions'    defaults to "pum,tagfile"

vim.g.python3_host_prog = '/usr/bin/python'

local opts       = {
  cursorcolumn   = true,
  cursorline     = true,
  smartcase      = true,
  hlsearch       = false,
  number         = true,
  relativenumber = true,
  softtabstop    = 2,
  tabstop        = 2,
  expandtab      = true,
  termguicolors  = true,
}

for k, v in pairs(opts) do
  vim.opt[k] = v
end
