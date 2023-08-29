inoremap jj <Esc>

nnoremap <Leader>; :

nnoremap <Leader>rw :Explore<CR>

nnoremap <Leader>eab :edit ${HOME}/.vim/rc/abbrevs.vim<CR>
nnoremap <Leader>ekm :edit ${HOME}/.vim/rc/keymaps.vim<CR>
nnoremap <Leader>eop :edit ${HOME}/.vim/rc/options.vim<CR>
nnoremap <Leader>epg :edit ${HOME}/.vim/rc/plugins.vim<CR>
nnoremap <Leader>erc :edit ${HOME}/.vim/vimrc<CR>
nnoremap <Leader>ewo :edit ${HOME}/.vim/dict/words.txt<CR>

nnoremap <Leader>sab :source ${HOME}/.vim/rc/abbrevs.vim<CR>
nnoremap <Leader>skm :source ${HOME}/.vim/rc/keymaps.vim<CR>
nnoremap <Leader>sop :source ${HOME}/.vim/rc/options.vim<CR>
nnoremap <Leader>spg :source ${HOME}/.vim/rc/plugins.vim<CR>
nnoremap <Leader>src :source ${HOME}/.vim/vimrc<CR>
nnoremap <Leader>swo :source ${HOME}/.vim/dict/words.txt<CR>

nnoremap <Leader>pc :PlugClean<CR>
nnoremap <Leader>pg :PlugUpgrade<CR>
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>pu :PlugUpdate<CR>

nnoremap <Leader>ue :UltiSnipsEdit<CR>

nnoremap <Leader>sf :FZF<CR>
nnoremap <Leader>sg :Ag<CR>
