call plug#begin('~/.vim/plugged')

Plug 'godlygeek/tabular'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'sirver/ultisnips'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

Plug 'wellle/targets.vim'

call plug#end()

if has("gui_running")
  colorscheme seoul256
  set guifont=JetBrainsMono\ Nerd\ Font\ 10
  set guioptions+=d
  set guioptions-=l
  set guioptions-=T
  set guioptions-=b
  set guioptions-=m
  set guioptions-=r
else
  colorscheme dracula
endif

" UltiSnips
let g:UltiSnipsSnippetDirectories=['~/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger='<Tab>'
let g:UltiSnipsJumpForwardTrigger='<Tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'
let g:UltiSnipsEditSplit='vertical'
