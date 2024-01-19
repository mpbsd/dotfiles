let s:github_repo = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
let s:install_cmd = '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs ' . s:github_repo

if empty(glob('~/.vim/autoload/plug.vim'))
  sil exe s:install_cmd
endif

call plug#begin('~/.vim/plugged')
" Plug 'tpope/vim-jdaddy'
" Plug 'tpope/vim-rhubarb'
Plug 'arcticicestudio/nord-vim'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
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
Plug 'vimwiki/vimwiki'
Plug 'wellle/targets.vim'
call plug#end()
