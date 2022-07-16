let g:python3_host_prog = '/usr/bin/python'

let mapleader="\<Space>"

set number
set relativenumber

set cursorcolumn
set cursorline

set colorcolumn=80
set textwidth=80

set hidden

set showcmd

set history=1000

set splitright

set ignorecase
set nohlsearch
set smartcase

set expandtab
set shiftwidth=2
set tabstop=2

set nobackup
set nowritebackup
set noswapfile

set undofile

set dict+=~/.vim/dict/frequently_used_words.txt
set spelllang=en,pt

iabbrev aa à
iabbrev eh é

inoremap jk <Esc>

nnoremap <Leader>; :

nnoremap <Leader>fq :q<CR>
nnoremap <Leader>fs :w<CR>

nnoremap <Leader>oe :edit $MYVIMRC<CR>
nnoremap <Leader>os :source $MYVIMRC<CR>

nnoremap <Leader>pg :PlugUpgrade<CR>
nnoremap <Leader>pu :PlugUpdate<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap <C-t> <Esc>b~ea
inoremap <C-u> <Esc>gUiwea

function TitleCaseSentence(l_or_u)
  if a:l_or_u ==# 'l'
    s/\<\(\w\)/\l\1/g
  elseif a:l_or_u ==# 'u'
    s/\<\(\w\)/\u\1/g
  endif
endfunction

nnoremap <Leader>lc :call TitleCaseSentence('l')<CR>
nnoremap <Leader>uc :call TitleCaseSentence('u')<CR>

" Manage plugins with vim-plug

call plug#begin()

Plug 'godlygeek/tabular'
Plug 'junegunn/goyo.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'sirver/ultisnips'

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

Plug 'vim-airline/vim-airline'
Plug 'vimwiki/vimwiki'
Plug 'wellle/targets.vim'

Plug 'dracula/vim', {'as': 'dracula'}
Plug 'gruvbox-community/gruvbox'
Plug 'mpbsd/vim-ledgendary'

call plug#end()

set t_Co=256
set background=dark
colorscheme gruvbox

" vim-airline config

let g:airline_detect_modified=1
let g:airline_symbols_ascii=1

let g:UltiSnipsSnippetDirectories=["~/.vim/UltiSnips"]
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsEditSplit="horizontal"

" Telescope

nnoremap <Leader>ff <Cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <Leader>fg <Cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap <Leader>fb <Cmd>lua require('telescope.builtin').buffers()<CR>
nnoremap <Leader>fh <Cmd>lua require('telescope.builtin').help_tags()<CR>

" VimWiki

let g:vimwiki_list = [{'path': '~/projects/vimwiki/', 'path_html': '~/projects/vimwiki/html/'}]

" Markdown bindings and settings

function MarkdownHeaderLevel(header_level)
  if a:header_level ==# '1'
    normal! yypVr=
  elseif a:header_level ==# '2'
    normal! yypVr-
  elseif a:header_level ==# '3'
    normal! I###
  elseif a:header_level ==# '4'
    normal! I####
  elseif a:header_level ==# '5'
    normal! I#####
  elseif a:header_level ==# '6'
    normal! I######
  endif
endfunction

nnoremap <Leader>h1 :call MarkdownHeaderLevel('1')<CR>
nnoremap <Leader>h2 :call MarkdownHeaderLevel('2')<CR>
nnoremap <Leader>h3 :call MarkdownHeaderLevel('3')<CR>
nnoremap <Leader>h4 :call MarkdownHeaderLevel('4')<CR>
nnoremap <Leader>h5 :call MarkdownHeaderLevel('5')<CR>
nnoremap <Leader>h6 :call MarkdownHeaderLevel('6')<CR>

" LaTeX bindings and settings

let g:tex_flavor="latex"

nnoremap <Leader>f= /<++><CR>
nnoremap <Leader>b= ?<++><CR>

nnoremap <Leader>c= ciw
nnoremap <Leader>d= daw<CR>

iabbrev lmt longmapsto
iabbrev lra longrightarrow

iabbrev 12n {1,\ldots,n\}

function LaTeXSubOrSuperscript(lower_or_upper_index, index_value)
  if a:lower_or_upper_index ==# 'lower'
    let l:latex_suffix = '_{' . a:index_value . '}'
  elseif a:lower_or_upper_index ==# 'upper'
    let l:latex_suffix = '^{' . a:index_value . '}'
  endif
  execute 'normal! a' . latex_suffix
endfunction

nnoremap <Leader>bn1  :call LaTeXSubOrSuperscript('lower', '-1')<CR>
nnoremap <Leader>bn2  :call LaTeXSubOrSuperscript('lower', '-2')<CR>
nnoremap <Leader>bn3  :call LaTeXSubOrSuperscript('lower', '-3')<CR>
nnoremap <Leader>bn4  :call LaTeXSubOrSuperscript('lower', '-4')<CR>
nnoremap <Leader>bn5  :call LaTeXSubOrSuperscript('lower', '-5')<CR>
nnoremap <Leader>bn6  :call LaTeXSubOrSuperscript('lower', '-6')<CR>
nnoremap <Leader>bn7  :call LaTeXSubOrSuperscript('lower', '-7')<CR>
nnoremap <Leader>bn8  :call LaTeXSubOrSuperscript('lower', '-8')<CR>
nnoremap <Leader>bn9  :call LaTeXSubOrSuperscript('lower', '-9')<CR>
nnoremap <Leader>bna  :call LaTeXSubOrSuperscript('lower', '-a')<CR>
nnoremap <Leader>bnb  :call LaTeXSubOrSuperscript('lower', '-b')<CR>
nnoremap <Leader>bnc  :call LaTeXSubOrSuperscript('lower', '-c')<CR>
nnoremap <Leader>bnd  :call LaTeXSubOrSuperscript('lower', '-d')<CR>
nnoremap <Leader>bne  :call LaTeXSubOrSuperscript('lower', '-e')<CR>
nnoremap <Leader>bnf  :call LaTeXSubOrSuperscript('lower', '-f')<CR>
nnoremap <Leader>bng  :call LaTeXSubOrSuperscript('lower', '-g')<CR>
nnoremap <Leader>bnh  :call LaTeXSubOrSuperscript('lower', '-h')<CR>
nnoremap <Leader>bni  :call LaTeXSubOrSuperscript('lower', '-i')<CR>
nnoremap <Leader>bnj  :call LaTeXSubOrSuperscript('lower', '-j')<CR>
nnoremap <Leader>bnk  :call LaTeXSubOrSuperscript('lower', '-k')<CR>
nnoremap <Leader>bnl  :call LaTeXSubOrSuperscript('lower', '-l')<CR>
nnoremap <Leader>bnm  :call LaTeXSubOrSuperscript('lower', '-m')<CR>
nnoremap <Leader>bnn  :call LaTeXSubOrSuperscript('lower', '-n')<CR>
nnoremap <Leader>bno  :call LaTeXSubOrSuperscript('lower', '-o')<CR>
nnoremap <Leader>bnp  :call LaTeXSubOrSuperscript('lower', '-p')<CR>
nnoremap <Leader>bnq  :call LaTeXSubOrSuperscript('lower', '-q')<CR>
nnoremap <Leader>bnr  :call LaTeXSubOrSuperscript('lower', '-r')<CR>
nnoremap <Leader>bns  :call LaTeXSubOrSuperscript('lower', '-s')<CR>
nnoremap <Leader>bnt  :call LaTeXSubOrSuperscript('lower', '-t')<CR>
nnoremap <Leader>bnu  :call LaTeXSubOrSuperscript('lower', '-u')<CR>
nnoremap <Leader>bnv  :call LaTeXSubOrSuperscript('lower', '-v')<CR>
nnoremap <Leader>bnw  :call LaTeXSubOrSuperscript('lower', '-w')<CR>
nnoremap <Leader>bnx  :call LaTeXSubOrSuperscript('lower', '-x')<CR>
nnoremap <Leader>bny  :call LaTeXSubOrSuperscript('lower', '-y')<CR>
nnoremap <Leader>bnz  :call LaTeXSubOrSuperscript('lower', '-z')<CR>
nnoremap <Leader>bp0  :call LaTeXSubOrSuperscript('lower',  '0')<CR>
nnoremap <Leader>bp1  :call LaTeXSubOrSuperscript('lower',  '1')<CR>
nnoremap <Leader>bp2  :call LaTeXSubOrSuperscript('lower',  '2')<CR>
nnoremap <Leader>bp3  :call LaTeXSubOrSuperscript('lower',  '3')<CR>
nnoremap <Leader>bp4  :call LaTeXSubOrSuperscript('lower',  '4')<CR>
nnoremap <Leader>bp5  :call LaTeXSubOrSuperscript('lower',  '5')<CR>
nnoremap <Leader>bp6  :call LaTeXSubOrSuperscript('lower',  '6')<CR>
nnoremap <Leader>bp7  :call LaTeXSubOrSuperscript('lower',  '7')<CR>
nnoremap <Leader>bp8  :call LaTeXSubOrSuperscript('lower',  '8')<CR>
nnoremap <Leader>bp9  :call LaTeXSubOrSuperscript('lower',  '9')<CR>
nnoremap <Leader>bpa  :call LaTeXSubOrSuperscript('lower',  'a')<CR>
nnoremap <Leader>bpb  :call LaTeXSubOrSuperscript('lower',  'b')<CR>
nnoremap <Leader>bpc  :call LaTeXSubOrSuperscript('lower',  'c')<CR>
nnoremap <Leader>bpd  :call LaTeXSubOrSuperscript('lower',  'd')<CR>
nnoremap <Leader>bpe  :call LaTeXSubOrSuperscript('lower',  'e')<CR>
nnoremap <Leader>bpf  :call LaTeXSubOrSuperscript('lower',  'f')<CR>
nnoremap <Leader>bpg  :call LaTeXSubOrSuperscript('lower',  'g')<CR>
nnoremap <Leader>bph  :call LaTeXSubOrSuperscript('lower',  'h')<CR>
nnoremap <Leader>bpi  :call LaTeXSubOrSuperscript('lower',  'i')<CR>
nnoremap <Leader>bpj  :call LaTeXSubOrSuperscript('lower',  'j')<CR>
nnoremap <Leader>bpk  :call LaTeXSubOrSuperscript('lower',  'k')<CR>
nnoremap <Leader>bpl  :call LaTeXSubOrSuperscript('lower',  'l')<CR>
nnoremap <Leader>bpm  :call LaTeXSubOrSuperscript('lower',  'm')<CR>
nnoremap <Leader>bpn  :call LaTeXSubOrSuperscript('lower',  'n')<CR>
nnoremap <Leader>bpo  :call LaTeXSubOrSuperscript('lower',  'o')<CR>
nnoremap <Leader>bpp  :call LaTeXSubOrSuperscript('lower',  'p')<CR>
nnoremap <Leader>bpq  :call LaTeXSubOrSuperscript('lower',  'q')<CR>
nnoremap <Leader>bpr  :call LaTeXSubOrSuperscript('lower',  'r')<CR>
nnoremap <Leader>bps  :call LaTeXSubOrSuperscript('lower',  's')<CR>
nnoremap <Leader>bpt  :call LaTeXSubOrSuperscript('lower',  't')<CR>
nnoremap <Leader>bpu  :call LaTeXSubOrSuperscript('lower',  'u')<CR>
nnoremap <Leader>bpv  :call LaTeXSubOrSuperscript('lower',  'v')<CR>
nnoremap <Leader>bpw  :call LaTeXSubOrSuperscript('lower',  'w')<CR>
nnoremap <Leader>bpx  :call LaTeXSubOrSuperscript('lower',  'x')<CR>
nnoremap <Leader>bpy  :call LaTeXSubOrSuperscript('lower',  'y')<CR>
nnoremap <Leader>bpz  :call LaTeXSubOrSuperscript('lower',  'z')<CR>
nnoremap <Leader>pn1  :call LaTeXSubOrSuperscript('upper', '-1')<CR>
nnoremap <Leader>pn2  :call LaTeXSubOrSuperscript('upper', '-2')<CR>
nnoremap <Leader>pn3  :call LaTeXSubOrSuperscript('upper', '-3')<CR>
nnoremap <Leader>pn4  :call LaTeXSubOrSuperscript('upper', '-4')<CR>
nnoremap <Leader>pn5  :call LaTeXSubOrSuperscript('upper', '-5')<CR>
nnoremap <Leader>pn6  :call LaTeXSubOrSuperscript('upper', '-6')<CR>
nnoremap <Leader>pn7  :call LaTeXSubOrSuperscript('upper', '-7')<CR>
nnoremap <Leader>pn8  :call LaTeXSubOrSuperscript('upper', '-8')<CR>
nnoremap <Leader>pn9  :call LaTeXSubOrSuperscript('upper', '-9')<CR>
nnoremap <Leader>pna  :call LaTeXSubOrSuperscript('upper', '-a')<CR>
nnoremap <Leader>pnb  :call LaTeXSubOrSuperscript('upper', '-b')<CR>
nnoremap <Leader>pnc  :call LaTeXSubOrSuperscript('upper', '-c')<CR>
nnoremap <Leader>pnd  :call LaTeXSubOrSuperscript('upper', '-d')<CR>
nnoremap <Leader>pne  :call LaTeXSubOrSuperscript('upper', '-e')<CR>
nnoremap <Leader>pnf  :call LaTeXSubOrSuperscript('upper', '-f')<CR>
nnoremap <Leader>png  :call LaTeXSubOrSuperscript('upper', '-g')<CR>
nnoremap <Leader>pnh  :call LaTeXSubOrSuperscript('upper', '-h')<CR>
nnoremap <Leader>pni  :call LaTeXSubOrSuperscript('upper', '-i')<CR>
nnoremap <Leader>pnj  :call LaTeXSubOrSuperscript('upper', '-j')<CR>
nnoremap <Leader>pnk  :call LaTeXSubOrSuperscript('upper', '-k')<CR>
nnoremap <Leader>pnl  :call LaTeXSubOrSuperscript('upper', '-l')<CR>
nnoremap <Leader>pnm  :call LaTeXSubOrSuperscript('upper', '-m')<CR>
nnoremap <Leader>pnn  :call LaTeXSubOrSuperscript('upper', '-n')<CR>
nnoremap <Leader>pno  :call LaTeXSubOrSuperscript('upper', '-o')<CR>
nnoremap <Leader>pnp  :call LaTeXSubOrSuperscript('upper', '-p')<CR>
nnoremap <Leader>pnq  :call LaTeXSubOrSuperscript('upper', '-q')<CR>
nnoremap <Leader>pnr  :call LaTeXSubOrSuperscript('upper', '-r')<CR>
nnoremap <Leader>pns  :call LaTeXSubOrSuperscript('upper', '-s')<CR>
nnoremap <Leader>pnt  :call LaTeXSubOrSuperscript('upper', '-t')<CR>
nnoremap <Leader>pnu  :call LaTeXSubOrSuperscript('upper', '-u')<CR>
nnoremap <Leader>pnv  :call LaTeXSubOrSuperscript('upper', '-v')<CR>
nnoremap <Leader>pnw  :call LaTeXSubOrSuperscript('upper', '-w')<CR>
nnoremap <Leader>pnx  :call LaTeXSubOrSuperscript('upper', '-x')<CR>
nnoremap <Leader>pny  :call LaTeXSubOrSuperscript('upper', '-y')<CR>
nnoremap <Leader>pnz  :call LaTeXSubOrSuperscript('upper', '-z')<CR>
nnoremap <Leader>pp1  :call LaTeXSubOrSuperscript('upper',  '1')<CR>
nnoremap <Leader>pp2  :call LaTeXSubOrSuperscript('upper',  '2')<CR>
nnoremap <Leader>pp3  :call LaTeXSubOrSuperscript('upper',  '3')<CR>
nnoremap <Leader>pp4  :call LaTeXSubOrSuperscript('upper',  '4')<CR>
nnoremap <Leader>pp5  :call LaTeXSubOrSuperscript('upper',  '5')<CR>
nnoremap <Leader>pp6  :call LaTeXSubOrSuperscript('upper',  '6')<CR>
nnoremap <Leader>pp7  :call LaTeXSubOrSuperscript('upper',  '7')<CR>
nnoremap <Leader>pp8  :call LaTeXSubOrSuperscript('upper',  '8')<CR>
nnoremap <Leader>pp9  :call LaTeXSubOrSuperscript('upper',  '9')<CR>
nnoremap <Leader>ppa  :call LaTeXSubOrSuperscript('upper',  'a')<CR>
nnoremap <Leader>ppb  :call LaTeXSubOrSuperscript('upper',  'b')<CR>
nnoremap <Leader>ppc  :call LaTeXSubOrSuperscript('upper',  'c')<CR>
nnoremap <Leader>ppd  :call LaTeXSubOrSuperscript('upper',  'd')<CR>
nnoremap <Leader>ppe  :call LaTeXSubOrSuperscript('upper',  'e')<CR>
nnoremap <Leader>ppf  :call LaTeXSubOrSuperscript('upper',  'f')<CR>
nnoremap <Leader>ppg  :call LaTeXSubOrSuperscript('upper',  'g')<CR>
nnoremap <Leader>pph  :call LaTeXSubOrSuperscript('upper',  'h')<CR>
nnoremap <Leader>ppi  :call LaTeXSubOrSuperscript('upper',  'i')<CR>
nnoremap <Leader>ppj  :call LaTeXSubOrSuperscript('upper',  'j')<CR>
nnoremap <Leader>ppk  :call LaTeXSubOrSuperscript('upper',  'k')<CR>
nnoremap <Leader>ppl  :call LaTeXSubOrSuperscript('upper',  'l')<CR>
nnoremap <Leader>ppm  :call LaTeXSubOrSuperscript('upper',  'm')<CR>
nnoremap <Leader>ppn  :call LaTeXSubOrSuperscript('upper',  'n')<CR>
nnoremap <Leader>ppo  :call LaTeXSubOrSuperscript('upper',  'o')<CR>
nnoremap <Leader>ppp  :call LaTeXSubOrSuperscript('upper',  'p')<CR>
nnoremap <Leader>ppq  :call LaTeXSubOrSuperscript('upper',  'q')<CR>
nnoremap <Leader>ppr  :call LaTeXSubOrSuperscript('upper',  'r')<CR>
nnoremap <Leader>pps  :call LaTeXSubOrSuperscript('upper',  's')<CR>
nnoremap <Leader>ppt  :call LaTeXSubOrSuperscript('upper',  't')<CR>
nnoremap <Leader>ppu  :call LaTeXSubOrSuperscript('upper',  'u')<CR>
nnoremap <Leader>ppv  :call LaTeXSubOrSuperscript('upper',  'v')<CR>
nnoremap <Leader>ppw  :call LaTeXSubOrSuperscript('upper',  'w')<CR>
nnoremap <Leader>ppx  :call LaTeXSubOrSuperscript('upper',  'x')<CR>
nnoremap <Leader>ppy  :call LaTeXSubOrSuperscript('upper',  'y')<CR>
nnoremap <Leader>ppz  :call LaTeXSubOrSuperscript('upper',  'z')<CR>

function LaTeXMathBB(letter)
  if a:letter ==# 'a'
    let l:latex_mathbb_cmd = '\mathbb{A}'
  elseif a:letter ==# 'b'
    let l:latex_mathbb_cmd = '\mathbb{B}'
  elseif a:letter ==# 'c'
    let l:latex_mathbb_cmd = '\mathbb{C}'
  elseif a:letter ==# 'd'
    let l:latex_mathbb_cmd = '\mathbb{D}'
  elseif a:letter ==# 'e'
    let l:latex_mathbb_cmd = '\mathbb{E}'
  elseif a:letter ==# 'f'
    let l:latex_mathbb_cmd = '\mathbb{F}'
  elseif a:letter ==# 'g'
    let l:latex_mathbb_cmd = '\mathbb{G}'
  elseif a:letter ==# 'h'
    let l:latex_mathbb_cmd = '\mathbb{H}'
  elseif a:letter ==# 'i'
    let l:latex_mathbb_cmd = '\mathbb{I}'
  elseif a:letter ==# 'j'
    let l:latex_mathbb_cmd = '\mathbb{J}'
  elseif a:letter ==# 'k'
    let l:latex_mathbb_cmd = '\mathbb{K}'
  elseif a:letter ==# 'l'
    let l:latex_mathbb_cmd = '\mathbb{L}'
  elseif a:letter ==# 'm'
    let l:latex_mathbb_cmd = '\mathbb{M}'
  elseif a:letter ==# 'n'
    let l:latex_mathbb_cmd = '\mathbb{N}'
  elseif a:letter ==# 'o'
    let l:latex_mathbb_cmd = '\mathbb{O}'
  elseif a:letter ==# 'p'
    let l:latex_mathbb_cmd = '\mathbb{P}'
  elseif a:letter ==# 'q'
    let l:latex_mathbb_cmd = '\mathbb{Q}'
  elseif a:letter ==# 'r'
    let l:latex_mathbb_cmd = '\mathbb{R}'
  elseif a:letter ==# 's'
    let l:latex_mathbb_cmd = '\mathbb{S}'
  elseif a:letter ==# 't'
    let l:latex_mathbb_cmd = '\mathbb{T}'
  elseif a:letter ==# 'u'
    let l:latex_mathbb_cmd = '\mathbb{U}'
  elseif a:letter ==# 'v'
    let l:latex_mathbb_cmd = '\mathbb{V}'
  elseif a:letter ==# 'w'
    let l:latex_mathbb_cmd = '\mathbb{W}'
  elseif a:letter ==# 'x'
    let l:latex_mathbb_cmd = '\mathbb{X}'
  elseif a:letter ==# 'y'
    let l:latex_mathbb_cmd = '\mathbb{Y}'
  elseif a:letter ==# 'z'
    let l:latex_mathbb_cmd = '\mathbb{Z}'
  endif
  execute 'normal! i' . latex_mathbb_cmd
endfunction

nnoremap <Leader>mbba :call LaTeXMathBB('a')<CR>
nnoremap <Leader>mbbb :call LaTeXMathBB('b')<CR>
nnoremap <Leader>mbbc :call LaTeXMathBB('c')<CR>
nnoremap <Leader>mbbd :call LaTeXMathBB('d')<CR>
nnoremap <Leader>mbbe :call LaTeXMathBB('e')<CR>
nnoremap <Leader>mbbf :call LaTeXMathBB('f')<CR>
nnoremap <Leader>mbbg :call LaTeXMathBB('g')<CR>
nnoremap <Leader>mbbh :call LaTeXMathBB('h')<CR>
nnoremap <Leader>mbbi :call LaTeXMathBB('i')<CR>
nnoremap <Leader>mbbj :call LaTeXMathBB('j')<CR>
nnoremap <Leader>mbbk :call LaTeXMathBB('k')<CR>
nnoremap <Leader>mbbl :call LaTeXMathBB('l')<CR>
nnoremap <Leader>mbbm :call LaTeXMathBB('m')<CR>
nnoremap <Leader>mbbn :call LaTeXMathBB('n')<CR>
nnoremap <Leader>mbbo :call LaTeXMathBB('o')<CR>
nnoremap <Leader>mbbp :call LaTeXMathBB('p')<CR>
nnoremap <Leader>mbbq :call LaTeXMathBB('q')<CR>
nnoremap <Leader>mbbr :call LaTeXMathBB('r')<CR>
nnoremap <Leader>mbbs :call LaTeXMathBB('s')<CR>
nnoremap <Leader>mbbt :call LaTeXMathBB('t')<CR>
nnoremap <Leader>mbbu :call LaTeXMathBB('u')<CR>
nnoremap <Leader>mbbv :call LaTeXMathBB('v')<CR>
nnoremap <Leader>mbbw :call LaTeXMathBB('w')<CR>
nnoremap <Leader>mbbx :call LaTeXMathBB('x')<CR>
nnoremap <Leader>mbby :call LaTeXMathBB('y')<CR>
nnoremap <Leader>mbbz :call LaTeXMathBB('z')<CR>

function LaTeXEnvironment(environment_name)
  let l:opening_environment = '\begin{' . a:environment_name . '}'
  let l:closing_environment = '\end{' . a:environment_name . '}'
  if a:environment_name ==# 'document'
    execute 'normal! o' . opening_environment
    execute 'normal! o' . '<++>'
    execute 'normal! o' . closing_environment
  else
    execute 'normal! o' . opening_environment
    execute 'normal! o' . '\label{<++>}'
    execute 'normal! o' . '<++>'
    execute 'normal! o' . closing_environment
    execute 'normal! o' . '<++>'
  endif
  ?<++>
endfunction

nnoremap <Leader>ldef :call LaTeXEnvironment('definition')<CR>
nnoremap <Leader>ldoc :call LaTeXEnvironment('document')<CR>
nnoremap <Leader>lequ :call LaTeXEnvironment('equation')<CR>
nnoremap <Leader>lexa :call LaTeXEnvironment('example')<CR>
nnoremap <Leader>lrem :call LaTeXEnvironment('remark')<CR>

nnoremap <Leader>lcor :call LaTeXEnvironment('corollary')<CR>
nnoremap <Leader>llem :call LaTeXEnvironment('lemma')<CR>
nnoremap <Leader>lpro :call LaTeXEnvironment('proposition')<CR>
nnoremap <Leader>lthe :call LaTeXEnvironment('theorem')<CR>

function LaTeXMatrixEnvironment(matrix_type, ncols)
  let l:opening_environment = '\begin{' . a:matrix_type . '}'
  let l:closing_environment = '\end{' . a:matrix_type . '}'
  execute 'normal! o' . '\['
  execute 'normal! o' . l:opening_environment
  if a:matrix_type ==# 'array'
    execute 'normal! a' . '{'
    for i in range(a:ncols)
      execute 'normal! a' . 'c'
    endfor
    execute 'normal! a' . '}'
  endif
  execute 'normal! o'
  for i in range(a:ncols)
    if i < a:ncols-1
      execute 'normal! a' . ' <++> &'
    else
      execute 'normal! a' . ' <++> \\'
    endif
  endfor
  execute 'normal! o' . l:closing_environment
  execute 'normal! o' . '\]'
  execute 'normal! o' . '<++>'
  ?<++>
endfunction

nnoremap <Leader>lam2 :call LaTeXMatrixEnvironment('array',   '2')<CR>
nnoremap <Leader>lam3 :call LaTeXMatrixEnvironment('array',   '3')<CR>
nnoremap <Leader>lam4 :call LaTeXMatrixEnvironment('array',   '4')<CR>
nnoremap <Leader>lam5 :call LaTeXMatrixEnvironment('array',   '5')<CR>
nnoremap <Leader>lam6 :call LaTeXMatrixEnvironment('array',   '6')<CR>
nnoremap <Leader>lam7 :call LaTeXMatrixEnvironment('array',   '7')<CR>
nnoremap <Leader>lam8 :call LaTeXMatrixEnvironment('array',   '8')<CR>
nnoremap <Leader>lam9 :call LaTeXMatrixEnvironment('array',   '9')<CR>
nnoremap <Leader>lbm2 :call LaTeXMatrixEnvironment('bmatrix', '2')<CR>
nnoremap <Leader>lbm3 :call LaTeXMatrixEnvironment('bmatrix', '3')<CR>
nnoremap <Leader>lbm4 :call LaTeXMatrixEnvironment('bmatrix', '4')<CR>
nnoremap <Leader>lbm5 :call LaTeXMatrixEnvironment('bmatrix', '5')<CR>
nnoremap <Leader>lbm6 :call LaTeXMatrixEnvironment('bmatrix', '6')<CR>
nnoremap <Leader>lbm7 :call LaTeXMatrixEnvironment('bmatrix', '7')<CR>
nnoremap <Leader>lbm8 :call LaTeXMatrixEnvironment('bmatrix', '8')<CR>
nnoremap <Leader>lbm9 :call LaTeXMatrixEnvironment('bmatrix', '9')<CR>
nnoremap <Leader>lpm2 :call LaTeXMatrixEnvironment('pmatrix', '2')<CR>
nnoremap <Leader>lpm3 :call LaTeXMatrixEnvironment('pmatrix', '3')<CR>
nnoremap <Leader>lpm4 :call LaTeXMatrixEnvironment('pmatrix', '4')<CR>
nnoremap <Leader>lpm5 :call LaTeXMatrixEnvironment('pmatrix', '5')<CR>
nnoremap <Leader>lpm6 :call LaTeXMatrixEnvironment('pmatrix', '6')<CR>
nnoremap <Leader>lpm7 :call LaTeXMatrixEnvironment('pmatrix', '7')<CR>
nnoremap <Leader>lpm8 :call LaTeXMatrixEnvironment('pmatrix', '8')<CR>
nnoremap <Leader>lpm9 :call LaTeXMatrixEnvironment('pmatrix', '9')<CR>
