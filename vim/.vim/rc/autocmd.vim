" {{{ set foldmethod=marker for vim filetypes
augroup Foldmethod
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" {{{ autoload views
augroup AutoloadFolds
  autocmd!
  autocmd BufWinLeave *.c,*.h,*.py,*.sh,*.tex mkview
  autocmd BufWinEnter *.c,*.h,*.py,*.sh,*.tex silent! loadview
augroup END
" }}}
" {{{ automatically sort words and abbreviations files
augroup Sort
  autocmd!
  autocmd BufWinEnter *.abbrev,*.dict :%sort u
augroup END
" }}}
" {{{ create make commands for tex filetypes
augroup LaTeXBuildCmds
  autocmd!
  autocmd FileType tex nnoremap <localleader>mk :make<cr>
  autocmd FileType tex nnoremap <localleader>mb :make bib<cr>
  autocmd FileType tex nnoremap <localleader>mc :make clean<cr>
augroup END
" }}}
