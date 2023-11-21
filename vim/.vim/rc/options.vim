" appearance
set background=dark
colorscheme slate

set statusline=[%n]\ %f\ %m%=%{&fenc}\ %{&ff}\ %Y\ (%06l,%06v)

set encoding=utf8

set number
set relativenumber
set numberwidth=6

set tabstop=2
set shiftwidth=2
set expandtab

set autoindent
set smartindent

set cursorline
set cursorcolumn

set colorcolumn=80
set textwidth=80

" make searching great again
set ignorecase
set smartcase
set magic

set hidden

set lazyredraw

set nojoinspaces

set spelllang=en_us,pt_br
set spellsuggest=fast,20

set dict=~/.vim/spell/words.dict

set undofile

runtime ftplugin/man.vim

set secure
