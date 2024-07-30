if empty(mapcheck('<C-U>', 'i'))
  inoremap <C-U> <C-G>u<C-U>
endif
if empty(mapcheck('<C-W>', 'i'))
  inoremap <C-W> <C-G>u<C-W>
endif

nnoremap <Leader>sb :Buffers<CR>
nnoremap <Leader>sc :Files ~/.vim<CR>
nnoremap <Leader>sf :Files<CR>
nnoremap <Leader>sg :Ag<CR>
nnoremap <Leader>sm :Maps<CR>

nnoremap <Leader>le :e ~/.local/share/pta/2024.ledger<CR>

nnoremap Y y$

inoremap jj <Esc>
inoremap jk <Esc>
inoremap kk <Esc>

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nnoremap - :Ex<CR>

nnoremap <Leader>; :

nnoremap <Leader>w; :w<CR>
nnoremap <Leader>wa :wa<CR>

nnoremap <Leader>so :so %<CR>

nnoremap <Leader>q; :q<CR>
nnoremap <Leader>qa :qa<CR>

nnoremap <Leader>s- :sp<CR>
nnoremap <Leader>s\ :vs<CR>

nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

nnoremap <C-Left>  <C-W>>
nnoremap <C-Down>  <C-W>-
nnoremap <C-Up>    <C-W>+
nnoremap <C-Right> <C-W><

inoremap <localleader>tu <esc>mmbgUiw`ma
inoremap <localleader>tl <esc>mmbguiw`ma
inoremap <localleader>cc <esc>mmb~`ma

nnoremap <Leader>ch :colorscheme habamax<CR>
nnoremap <Leader>cl :colorscheme lunaperche<CR>
nnoremap <Leader>cp :colorscheme pablo<CR>
nnoremap <Leader>cs :colorscheme slate<CR>

nnoremap <Leader>mk :make<CR>
nnoremap <Leader>mb :make bib<CR>
nnoremap <Leader>mc :make clean<CR>
nnoremap <Leader>mf :make final<CR>
nnoremap <Leader>gb :call globals#vim_get_BibTeX_citation_keys()<CR>

nnoremap <Leader>ab :call globals#vim_add_cword_to_words_abbr()<CR>
nnoremap <Leader>aw :call globals#vim_add_cword_to_words_dict()<CR>

nnoremap <Leader>psi :call globals#vim_parse_students_info()<CR>
nnoremap <Leader>pei :call globals#vim_parse_eees_info()<CR>

nnoremap <Leader>388 :call globals#vim_edit_logbook('IME0388')<CR>
nnoremap <Leader>415 :call globals#vim_edit_logbook('IME0415')<CR>

nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>pd :PlugUpdate<CR>
nnoremap <Leader>pg :PlugUpgrade<CR>
nnoremap <Leader>pc :PlugClean<CR>

nnoremap <Leader>0g :0G<CR>

nnoremap <Leader>ue :UltiSnipsEdit<CR>

nnoremap <Leader>fdt :call globals#vim_format_dates_for_me()<CR>

nnoremap <Leader>atc :call globals#vim_format_cpfnrs_for_me('add_punct')<CR>
nnoremap <Leader>rfc :call globals#vim_format_cpfnrs_for_me('rm_punct')<CR>
