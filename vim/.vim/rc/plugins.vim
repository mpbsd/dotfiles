let s:github_repo = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
let s:install_cmd = '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs ' . s:github_repo

if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute s:install_cmd
endif

" plugins {{{ 1
call plug#begin('~/.vim/plugged')
  " by mpbsd {{{ 2
  Plug 'mpbsd/vim-caching'
  Plug 'mpbsd/vim-options'
  Plug 'mpbsd/vim-keymaps'
  Plug 'mpbsd/vim-autocmd'
  Plug 'mpbsd/vim-myspell'
  " ........ }}}
  Plug 'godlygeek/tabular'
  " by junegunn {{{ 2
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " Plug 'junegunn/goyo.vim'
  " Plug 'junegunn/limelight.vim'
  " Plug 'junegunn/seoul256.vim'
  " ........... }}}
  Plug 'sirver/ultisnips'
  " by tpope {{{ 2
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
  " ........ }}}
  Plug 'vim-airline/vim-airline'
  Plug 'vimwiki/vimwiki'
  Plug 'wellle/targets.vim'
call plug#end()
" ....... }}}

if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  PlugInstall --sync
  wincmd q
endif

" airline configuration {{{
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_section_x = '%{&fileencoding}'
let g:airline_section_y = '%{&fileformat} %Y'
let g:airline_section_z = '%P %06l:%06c'

let g:airline_theme='dark'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' C:'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' L:'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty=' ⚡'
" ..................... }}}

" ultisnips configuration {{{
let g:UltiSnipsSnippetDirectories  = ['~/.vim/ultisnips']
let g:UltiSnipsExpandTrigger       = '<tab>'
let g:UltiSnipsJumpForwardTrigger  = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
let g:UltiSnipsEditSplit           = 'tabdo'
" ....................... }}}

" vimwiki configuration {{{
let s:wiki1 = {
      \  'path': '~/.local/share/vimwiki/wiki1/',
      \  'index': 'index',
      \  'syntax': 'default',
      \  'ext': '.wiki',
      \}

let g:vimwiki_list = [s:wiki1]
" ..................... }}}

" vim: set fileencoding=utf-8: "
