inoremap jj <Esc>

nnoremap <Leader>; :

nnoremap <Leader>rw :Ex<CR>

nnoremap <Leader>eab :e ${HOME}/.vim/rc/abbrevs.vim<CR>
nnoremap <Leader>ekm :e ${HOME}/.vim/rc/keymaps.vim<CR>
nnoremap <Leader>eop :e ${HOME}/.vim/rc/options.vim<CR>
nnoremap <Leader>epg :e ${HOME}/.vim/rc/plugins.vim<CR>
nnoremap <Leader>erc :e ${HOME}/.vim/vimrc<CR>
nnoremap <Leader>ewo :e ${HOME}/.vim/dict/words.txt<CR>

nnoremap <Leader>sab :so ${HOME}/.vim/rc/abbrevs.vim<CR>
nnoremap <Leader>skm :so ${HOME}/.vim/rc/keymaps.vim<CR>
nnoremap <Leader>sop :so ${HOME}/.vim/rc/options.vim<CR>
nnoremap <Leader>spg :so ${HOME}/.vim/rc/plugins.vim<CR>
nnoremap <Leader>src :so ${HOME}/.vim/vimrc<CR>
nnoremap <Leader>swo :so ${HOME}/.vim/dict/words.txt<CR>

nnoremap <Leader>pc :PlugClean<CR>
nnoremap <Leader>pg :PlugUpgrade<CR>
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>pu :PlugUpdate<CR>

nnoremap <Leader>ue :UltiSnipsEdit<CR>

nnoremap <Leader>ff :FZF<CR>
nnoremap <Leader>fg :Ag<CR>
