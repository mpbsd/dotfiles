set background=dark

set number
set relativenumber
set numberwidth=6

set cursorline
set cursorcolumn

set colorcolumn=80
" set textwidth=80

set statusline=[%n]\ %f\ %m%=%{&fenc}\ %{&ff}\ %Y\ (%06l,%06v)

set tabstop=2
set shiftwidth=2
set expandtab

set autoindent
set smartindent

set wrap
set linebreak
set nolist

set nojoinspaces

set splitright
set splitbelow

set ignorecase
set smartcase
set magic

set lazyredraw

set encoding=utf8

set secure

set hidden

set undofile

runtime ftplugin/man.vim

set spelllang=en_us,pt_br
set spellsuggest=fast,20

set dict=~/.vim/spell/words.dict
