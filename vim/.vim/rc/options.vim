set background=dark
colorscheme habamax

set cursorline
" set cursorcolumn
set colorcolumn=80

set number
set relativenumber

set statusline=[%n]\ %f\ %m%=%{&fileformat}\ %{&fileencoding}\ %Y\ %06l,%06v

set tabstop=2
set shiftwidth=2
set expandtab

set lazyredraw

set splitbelow
set splitright

set ignorecase
set smartcase

set showcmd

set dictionary=~/.vim/dict/words.txt
set spelllang=en_us,pt_br
set spellsuggest=fast,20

set hidden

set nojoinspaces

set backupdir=~/.cache/vim/backup
set directory=~/.cache/vim/swap
set viewdir=~/.cache/vim/view
set viminfofile=~/.cache/vim/.viminfo
set undodir=~/.cache/vim/undo
set undofile
let g:netrw_home='~/.cache/vim'

if has("gui_running")
  set guifont=TerminessNerdFont\ 12
  set guioptions+=d
  set guioptions-=l
  set guioptions-=T
  set guioptions-=b
  set guioptions-=m
  set guioptions-=r
endif

let g:tex_flavor='latex'

runtime ftplugin/man.vim
