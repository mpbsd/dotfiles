let mapleader="\<Space>"
let maplocalleader="\<Space>"

set background=dark
colorscheme habamax

set statusline=[%n]\ %f\ %m%=%{&fileencoding}\ %Y\ %06l,%06v

set ignorecase
set smartcase

set number
set relativenumber

set cursorline
set cursorcolumn

set spelllang=en_us,pt_br
set spellsuggest=fast,30

set dictionary=~/.vim/dict/words.txt

set hidden

set showcmd

set backupdir=~/.cache/vim/backup
set directory=~/.cache/vim/swap
set viewdir=~/.cache/vim/view

set viminfofile=~/.cache/vim/.viminfo

set undodir=~/.cache/vim/undo
set undofile

set lazyredraw

set nojoinspaces

set ruler

set tabstop=2
set shiftwidth=2
set expandtab

set wildoptions=pum,tagfile

function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction

if has("gui_running")
  set guifont=JetBrainsMono\ Nerd\ Font\ 10
  set guioptions+=d
  set guioptions-=l
  set guioptions-=T
  set guioptions-=b
  set guioptions-=m
  set guioptions-=r
endif

let g:netrw_home='~/.cache/vim'

let g:tex_flavor='latex'

runtime ftplugin/man.vim
