let s:github_repo = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
let s:install_cmd = '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs ' . s:github_repo

if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute s:install_cmd
endif

call plug#begin('~/.vim/plugged')
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'
" Plug 'junegunn/seoul256.vim'
" Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
" Plug 'tpope/vim-abolish'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
" Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vimwiki/vimwiki'
Plug 'wellle/targets.vim'
call plug#end()

let g:UltiSnipsSnippetDirectories  = ['~/.vim/ultisnips']
let g:UltiSnipsExpandTrigger       = '<tab>'
let g:UltiSnipsJumpForwardTrigger  = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
let g:UltiSnipsEditSplit           = 'tabdo'

let s:wiki1 = {
      \  'path': '~/.local/share/vimwiki/wiki1/',
      \  'index': 'index',
      \  'syntax': 'default',
      \  'ext': '.wiki',
      \}

let g:vimwiki_list = [s:wiki1]
" vim: set fileencoding=utf-8:
