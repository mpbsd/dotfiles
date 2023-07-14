let mapleader="\<Space>"

set background=dark

set ignorecase
set smartcase

set number
set relativenumber

set cursorline
set cursorcolumn

set statusline=[%n]\ %t\ %m%=%{&encoding}\ %{&ff}\ %Y\ %04l:%04c 

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

set wrap

set nojoinspaces

set ruler

set tabstop=2
set shiftwidth=2
set expandtab

set wildoptions=pum,tagfile

let g:netrw_home='~/.cache/vim'

let g:tex_flavor='latex'

runtime ftplugin/man.vim
