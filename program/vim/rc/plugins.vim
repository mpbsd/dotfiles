let s:A = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
let s:B = '!curl -fLo $XDG_DATA_HOME/vim/autoload/plug.vim --create-dirs '
let s:C = s:B . s:A

if empty(glob('$XDG_DATA_HOME/vim/autoload/plug.vim'))
  silent execute s:C
endif

call plug#begin('$XDG_DATA_HOME/vim/plugged')

Plug 'altercation/vim-colors-solarized'

Plug 'godlygeek/tabular'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'

Plug 'lervag/vimtex', { 'tag': 'v2.15' }

Plug 'sirver/ultisnips'

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'wellle/targets.vim'

call plug#end()

if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  PlugInstall --sync | wincmd q
endif
