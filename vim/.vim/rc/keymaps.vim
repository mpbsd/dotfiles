" {{{ edit/source config files
nnoremap <leader>erc :edit ~/.vim/vimrc<cr>
nnoremap <leader>eop :edit ~/.vim/rc/options.vim<cr>
nnoremap <leader>epg :edit ~/.vim/rc/plugins.vim<cr>
nnoremap <leader>eab :edit ~/.vim/rc/abbrevs.vim<cr>
nnoremap <leader>eau :edit ~/.vim/rc/autocmd.vim<cr>
nnoremap <leader>egb :edit ~/.vim/rc/globals.vim<cr>
nnoremap <leader>ekm :edit ~/.vim/rc/keymaps.vim<cr>

nnoremap <leader>src :source ~/.vim/vimrc<cr>
nnoremap <leader>sop :source ~/.vim/rc/options.vim<cr>
nnoremap <leader>spg :source ~/.vim/rc/plugins.vim<cr>
nnoremap <leader>sab :source ~/.vim/rc/abbrevs.vim<cr>
nnoremap <leader>sau :source ~/.vim/rc/autocmd.vim<cr>
nnoremap <leader>sgb :source ~/.vim/rc/globals.vim<cr>
nnoremap <leader>skm :source ~/.vim/rc/keymaps.vim<cr>

nnoremap <leader>ewo :edit ~/.vim/dict/words.txt<cr>
" }}}
" {{{ plugin management
nnoremap <localleader>pc :PlugClean<cr>
nnoremap <localleader>pg :PlugUpgrade<cr>
nnoremap <localleader>pi :PlugInstall<cr>
nnoremap <localleader>pu :PlugUpdate<cr>
" }}}
" {{{ window navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
" }}}

inoremap jj <esc>
nnoremap <leader>; :

nnoremap <localleader>fw :w<cr>
nnoremap <localleader>fq :q<cr>

inoremap <localleader>tu <esc>mmbgUiw`ma
inoremap <localleader>tl <esc>mmbguiw`ma

nnoremap <localleader>ex :Explore<cr>

nnoremap <localleader>sf :FZF<cr>
nnoremap <localleader>sa :Ag<cr>

nnoremap <localleader>se :UltiSnipsEdit<cr>

nnoremap <localleader>aw :call AddWordUnderCursorToWordsList()<cr>
