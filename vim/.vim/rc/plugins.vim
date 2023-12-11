let s:a = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
let s:b = '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs ' . s:a

if empty(expand('~/.vim/autoload/plug.vim'))
  sil exe s:b
endif

call plug#begin('~/.vim/plugged')
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
Plug 'sirver/ultisnips'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'wellle/targets.vim'
call plug#end()

if isdirectory(expand('~/.vim/plugged/gruvbox'))
  colorscheme gruvbox
else
  colorscheme habamax
endif

let g:UltiSnipsSnippetDirectories  = ['~/.vim/ultisnips']
let g:UltiSnipsExpandTrigger       = '<tab>'
let g:UltiSnipsJumpForwardTrigger  = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
let g:UltiSnipsEditSplit           = 'horizontal'
