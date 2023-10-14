
set background=dark
colorscheme habamax

set statusline=[%n]\ %f\ %m%=%{&fileencoding}\ %{&fileformat}\ %Y\ %06l,%06v

set encoding=utf8

set number
set relativenumber
set numberwidth=5

set tabstop=2
set shiftwidth=2
set expandtab

set autoindent
set smartindent

set cursorline
" set cursorcolumn

set colorcolumn=80
set textwidth=80

" make searching great again
set ignorecase
set smartcase
set magic

set hidden

set lazyredraw

set nojoinspaces

set showcmd

let g:tex_flavor='latex'

set spelllang=en_us,pt_br
set spellsuggest=fast,20

let g:netrw_home='~/.cache/vim'

set backupdir=~/.cache/vim/backup
set directory=~/.cache/vim/swap
set undodir=~/.cache/vim/undo
set viewdir=~/.cache/vim/view
set viminfofile=~/.cache/vim/.viminfo

set dictionary=~/.vim/spell/words.dict

set undofile

" if has("gui_running")
"   set t_Co=256
"   set guifont=TerminessNerdFont\ 12
"   set guiheadroom=0
"   set guioptions+=d
"   set guioptions-=T
"   set guioptions-=b
"   set guioptions-=l
"   set guioptions-=m
"   set guioptions-=r
" endif

runtime ftplugin/man.vim
