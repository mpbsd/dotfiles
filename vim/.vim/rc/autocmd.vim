" vim: ts=2 sw=2 et

" set foldmethod=marker for vim filetypes {{{
augroup vim_filetype
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

augroup Folds
  autocmd!
  autocmd BufWinLeave *.c,*.h,*.py,*.sh,*.tex mkview
  autocmd BufWinEnter *.c,*.h,*.py,*.sh,*.tex silent! loadview
augroup END

augroup LaTeX
  autocmd!
  autocmd FileType tex nnoremap <localleader>mm :make<cr>
  autocmd FileType tex nnoremap <localleader>md :make draft<cr>
  autocmd FileType tex nnoremap <localleader>mf :make final<cr>
  autocmd FileType tex nnoremap <localleader>mc :make clean<cr>
augroup END
