"vim: set foldmethod=marker "

set background=dark
colorscheme habamax

set number
set relativenumber

set tabstop=2
set shiftwidth=2
set expandtab

set splitbelow
set splitright

set cursorline
set cursorcolumn
set colorcolumn=80
set textwidth=80

set statusline=[%n]\ %f\ %m%=%{&fileformat}\ %{&fileencoding}\ %Y\ %06l,%06v

set ignorecase
set smartcase

set hidden
set lazyredraw
set nojoinspaces
set showcmd

let g:tex_flavor='latex'

set dictionary=~/.vim/dict/words.txt
set spelllang=en_us,pt_br
set spellsuggest=fast,20

set backupdir=~/.cache/vim/backup
set directory=~/.cache/vim/swap
set undodir=~/.cache/vim/undo
set undofile
set viewdir=~/.cache/vim/view

let g:netrw_home='~/.cache/vim'
set viminfofile=~/.cache/vim/.viminfo

if has("gui_running")
  set guifont=TerminessNerdFont\ 12
  set guioptions+=d
  set guioptions-=l
  set guioptions-=T
  set guioptions-=b
  set guioptions-=m
  set guioptions-=r
endif

runtime ftplugin/man.vim
