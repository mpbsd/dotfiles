nnoremap <Leader>ev :Files ~/.vim/rc<CR>
nnoremap <Leader>fa :Files ~/.vim/after/plugin<CR>
nnoremap <Leader>fp :Files ~/.vim/plugged<CR>
nnoremap <Leader>fs :Snippets<CR>

nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fg :Ag<CR>
nnoremap <Leader>fm :Maps<CR>

nnoremap Y y$

nnoremap <Leader>;w :w<CR>
nnoremap <Leader>;q :q<CR>
nnoremap <Leader>wa :wa<CR>
nnoremap <Leader>qa :qa<CR>

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

nnoremap <Leader>wth <C-W>t<C-W>H
nnoremap <Leader>wtk <C-W>t<C-W>K

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nnoremap <Leader>hs :call mpbsd#vim_search_for_help_in_new('s')<CR>
nnoremap <Leader>hv :call mpbsd#vim_search_for_help_in_new('v')<CR>
nnoremap <Leader>ht :call mpbsd#vim_search_for_help_in_new('t')<CR>

nnoremap K :call mpbsd#vim_find_help_cword(expand('<cword>'))<CR>

nnoremap <Leader>pd :PlugUpdate<CR>
nnoremap <Leader>pg :PlugUpgrade<CR>
nnoremap <Leader>pc :PlugClean<CR>

nnoremap <Leader>0g :0G<CR>

nnoremap <LocalLeader>es :UltiSnipsEdit<CR>

nnoremap <LocalLeader>x :so %<CR>

nnoremap <Leader>le :e ~/.local/share/pta/2024.ledger<CR>
