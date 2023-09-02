" vim: ts=2 sw=2 et

augroup Folds
  autocmd!
  autocmd BufWinLeave *.c,*.h,*.py,*.tex mkview
  autocmd BufWinEnter *.c,*.h,*.py,*.tex silent! loadview
augroup END

augroup LaTeX
  autocmd!
  autocmd FileType tex nnoremap <localleader>mm :make<cr>
  autocmd FileType tex nnoremap <localleader>md :make draft<cr>
  autocmd FileType tex nnoremap <localleader>mf :make final<cr>
  autocmd FileType tex nnoremap <localleader>mc :make clean<cr>
augroup END
