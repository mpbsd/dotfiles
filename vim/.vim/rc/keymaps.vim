inoremap jj <Esc>

nnoremap <leader>; :

nnoremap <leader>rw :Explore<CR>

nnoremap <leader>eab :edit ${HOME}/.vim/rc/abbrevs.vim<CR>
nnoremap <leader>ekm :edit ${HOME}/.vim/rc/keymaps.vim<CR>
nnoremap <leader>eop :edit ${HOME}/.vim/rc/options.vim<CR>
nnoremap <leader>epg :edit ${HOME}/.vim/rc/plugins.vim<CR>
nnoremap <leader>erc :edit ${HOME}/.vim/vimrc<CR>
nnoremap <leader>ewo :edit ${HOME}/.vim/dict/words.txt<CR>

nnoremap <leader>sab :source ${HOME}/.vim/rc/abbrevs.vim<CR>
nnoremap <leader>skm :source ${HOME}/.vim/rc/keymaps.vim<CR>
nnoremap <leader>sop :source ${HOME}/.vim/rc/options.vim<CR>
nnoremap <leader>spg :source ${HOME}/.vim/rc/plugins.vim<CR>
nnoremap <leader>src :source ${HOME}/.vim/vimrc<CR>
nnoremap <leader>swo :source ${HOME}/.vim/dict/words.txt<CR>

nnoremap <leader>pc :PlugClean<CR>
nnoremap <leader>pg :PlugUpgrade<CR>
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>

nnoremap <leader>ue :UltiSnipsEdit<CR>

nnoremap <leader>sf :FZF<CR>
nnoremap <leader>sg :Ag<CR>

inoremap <localleader>tu <Esc>mmbgUiw`ma
inoremap <localleader>tl <Esc>mmbguiw`ma

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
