set background=dark
colorscheme slate

set statusline=[%n]\ %f\ %m%=%{&fenc}\ %{&ff}\ %Y\ %06l,%06v

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

let g:tex_flavor='latex'

set spelllang=en_us,pt_br
set spellsuggest=fast,20

let g:netrw_home='~/.cache/vim'

set viminfofile=~/.cache/vim/.viminfo

set dictionary=~/.vim/spell/words.dict

let b:c_dirs = {"bdir": "bdir", "dir": "sdir", "udir": "udir", "vdir": "vdir"}
let b:c_dirs_parent_dir = "~/.cache/vim/"

for item in items(b:c_dirs)
  let b:k = item[0]
  let b:v = item[1]
  let b:d = b:c_dirs_parent_dir .. b:v
  let b:c = 'set ' .. b:k .. '=' .. b:d
  if !isdirectory(b:d)
    silent! execute "!mkdir -p " .. b:d
  endif
  execute b:c
endfor

set undofile

if has("gui_running")
  set t_Co=256
  " set guifont=TerminessNerdFont\ 12
  set guiheadroom=0
  " set guioptions+=d
  " set guioptions-=T
  " set guioptions-=b
  " set guioptions-=l
  " set guioptions-=m
  " set guioptions-=r
endif

runtime ftplugin/man.vim

set secure
