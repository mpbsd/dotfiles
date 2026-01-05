nnoremap <Leader>rc :e $XDG_CONFIG_HOME/vim/vimrc<CR>
nnoremap <Leader>cv :Files $XDG_CONFIG_HOME/vim/rc<CR>
nnoremap <Leader>fa :Files $XDG_CONFIG_HOME/vim/after/plugin<CR>
nnoremap <Leader>fp :Files $XDG_CONFIG_HOME/vim/plugged<CR>
nnoremap <Leader>fh :History<CR>
nnoremap <Leader>fs :Snippets<CR>

nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fg :Ag<CR>
nnoremap <Leader>fm :Maps<CR>
nnoremap <Leader>gf :call fzf#run({'source': 'git ls-files', 'sink': 'e'})<CR>

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

nnoremap <C-B> <C-B>zz
nnoremap <C-F> <C-F>zz
nnoremap <C-D> <C-D>zz
nnoremap <C-U> <C-U>zz

nnoremap n nzz
nnoremap N Nzz

nnoremap <BS> :nohls<CR>

nnoremap <Leader>hs :call mpbsd#vim_search_for_help_in_new('s')<CR>
nnoremap <Leader>hv :call mpbsd#vim_search_for_help_in_new('v')<CR>
nnoremap <Leader>ht :call mpbsd#vim_search_for_help_in_new('t')<CR>

nnoremap K :call mpbsd#vim_find_help_cword(expand('<cword>'))<CR>

nnoremap <Leader>; :
nnoremap <LocalLeader>q :q<CR>
nnoremap <LocalLeader>w :w<CR>
nnoremap Y y$

inoremap <LocalLeader>cc mmb~`ma
nnoremap <LocalLeader>cc mmb~`m
inoremap <LocalLeader>tu mmbgUiw`ma
nnoremap <LocalLeader>tu mmgUiw`m
inoremap <LocalLeader>tl mmbguiw`ma
nnoremap <LocalLeader>tl mmguiw`m

nnoremap <LocalLeader>db :call mpbsd#replace_non_ascii_chars()<CR>

nnoremap <Leader>ov :call mpbsd#toggle_between_opposite_values()<CR>
nnoremap <Leader>os :call mpbsd#toggle_between_opposite_signs()<CR>

nnoremap <LocalLeader>bd :set background=dark<CR>
nnoremap <LocalLeader>bl :set background=light<CR>

nnoremap <Leader>pd :PlugUpdate<CR>
nnoremap <Leader>pg :PlugUpgrade<CR>
nnoremap <Leader>pc :PlugClean<CR>

nnoremap <Leader>0g :0G<CR>

nnoremap <LocalLeader>es :UltiSnipsEdit<CR>

nnoremap <Leader>le :e $XDG_DATA_HOME/pta/2026.ledger<CR>

nnoremap <LocalLeader>dk :call deadk#toggle_dead_keys()<CR>

nnoremap <LocalLeader>uid :-1r!python3 -c 'import uuid; print(uuid.uuid4().hex)'<CR>

nnoremap <F8> :call mpbsd#format_distinct_configurations()<CR>
