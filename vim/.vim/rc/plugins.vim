call plug#begin('~/.vim/plugged')
" by chrisbra {{{
Plug 'chrisbra/csv.vim'
"}}}
" by godlygeek {{{
Plug 'godlygeek/tabular'
"}}}
" by junegunn {{{
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"}}}
" by sirver {{{
Plug 'sirver/ultisnips'
"}}}
" by tpope {{{
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
"}}}
" by wellle {{{
Plug 'wellle/targets.vim'
"}}}
call plug#end()

" ultisnips settings {{{
let g:UltiSnipsSnippetDirectories  = ['~/.vim/ultisnips']
let g:UltiSnipsExpandTrigger       = '<tab>'
let g:UltiSnipsJumpForwardTrigger  = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit           = 'horizontal'
" }}}
