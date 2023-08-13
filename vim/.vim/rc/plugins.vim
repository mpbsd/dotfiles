call plug#begin('~/.vim/plugged')

Plug 'chrisbra/csv.vim'

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

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

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

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ' ☰ '
let g:airline_symbols.dirty='⚡'

" UltiSnips
let g:UltiSnipsSnippetDirectories=['~/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger='<Tab>'
let g:UltiSnipsJumpForwardTrigger='<Tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'
let g:UltiSnipsEditSplit='vertical'
