" {{{ set foldmethod=marker for vim filetypes
augroup foldmethod_filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" {{{ autoload views
augroup autoload_folds
  autocmd!
  autocmd BufWinLeave *.c,*.h,*.py,*.sh,*.tex mkview
  autocmd BufWinEnter *.c,*.h,*.py,*.sh,*.tex silent! loadview
augroup END
" }}}
" {{{ automatically sort words and abbreviations files
augroup sorting_words_list
  autocmd!
  autocmd BufWinEnter *.abbrev,*.dict :%sort u
augroup END
" }}}
" {{{ create make commands for tex filetypes
augroup latex_build_cmds
  autocmd!
  autocmd FileType tex nnoremap <localleader>mk :make<cr>
  autocmd FileType tex nnoremap <localleader>mb :make bib<cr>
  autocmd FileType tex nnoremap <localleader>mc :make clean<cr>
augroup END
" }}}
