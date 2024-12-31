if empty(mapcheck('<C-U>', 'i'))
  inoremap <C-U> <C-G>u<C-U>
endif
if empty(mapcheck('<C-W>', 'i'))
  inoremap <C-W> <C-G>u<C-W>
endif

nnoremap <LocalLeader>fb :Buffers<CR>
nnoremap <LocalLeader>fc :Files ~/.vim<CR>
nnoremap <LocalLeader>ff :Files<CR>
nnoremap <LocalLeader>fg :Ag<CR>
nnoremap <LocalLeader>fm :Maps<CR>

nnoremap Y y$

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nnoremap - :Ex<CR>

nnoremap <Leader>; :

nnoremap <LocalLeader>zw :w<CR>
nnoremap <LocalLeader>wa :wa<CR>
nnoremap <LocalLeader>zq :q<CR>
nnoremap <LocalLeader>qa :qa<CR>

nnoremap <Leader>so :so %<CR>

nnoremap <Leader>s- :sp<CR>
nnoremap <Leader>s\ :vs<CR>

nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

nnoremap <C-Left>  <C-W>>
nnoremap <C-Down>  <C-W>-
nnoremap <C-Up>    <C-W>+
nnoremap <C-Right> <C-W><

nnoremap <Leader>vh :call globals#vim_open_help_in_a_new_tab()<CR>
nnoremap <Leader>vt :vert term<CR>

inoremap <LocalLeader>tu <Esc>mmbgUiw`ma
inoremap <LocalLeader>tl <Esc>mmbguiw`ma
inoremap <LocalLeader>cc <Esc>mmb~`ma

nnoremap <Leader>ch :colorscheme habamax<CR>
nnoremap <Leader>cl :colorscheme lunaperche<CR>
nnoremap <Leader>cp :colorscheme pablo<CR>
nnoremap <Leader>cs :colorscheme slate<CR>
nnoremap <Leader>cd :colorscheme desert<CR>
nnoremap <Leader>cq :colorscheme quiet<CR>

nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>pd :PlugUpdate<CR>
nnoremap <Leader>pg :PlugUpgrade<CR>
nnoremap <Leader>pc :PlugClean<CR>

nnoremap <Leader>0g :0G<CR>

nnoremap <Leader>ue :UltiSnipsEdit<CR>

nnoremap <Leader>le :e ~/.local/share/pta/2024.ledger<CR>

nnoremap <Leader>psi :call globals#vim_parse_students_info()<CR>

nnoremap <Leader>vfd :call globals#vim_format_dates_for_me()<CR>

nnoremap <Leader>eog :!eog data/<cWORD><CR>
nnoremap <Leader>tef :.m$<CR>

nnoremap <Leader>ucw :call globals#vim_upper_all_occurrences_of_cword_in_cbuffer(expand('<cword>'))<CR>
nnoremap <Leader>lcw :call globals#vim_lower_all_occurrences_of_cword_in_cbuffer(expand('<cword>'))<CR>
nnoremap <Leader>ccs :call globals#vim_camel_case_current_sentence()<CR>

nnoremap <Leader>vfc :call globals#vim_format_choices()<CR>

nnoremap <Leader>vcd :call globals#vim_create_csv_file_with_disciplines()<CR>
