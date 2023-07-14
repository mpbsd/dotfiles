augroup PersistentFolds
  autocmd!
  autocmd BufWinLeave *.c,*.h,*.md,*.py,*.tex mkview
  autocmd BufWinEnter *.c,*.h,*.md,*.py,*.tex silent! loadview
augroup END

augroup LaTeX
  autocmd!
  autocmd Filetype tex inoremap <C-l> <C-g>u<Esc>[s1z=`]a<C-g>u
  autocmd FileType tex nnoremap <Leader>mk :make<CR>
  autocmd FileType tex nnoremap <Leader>md :make draft<CR>
  autocmd FileType tex nnoremap <Leader>mf :make final<CR>
  autocmd FileType tex nnoremap <Leader>mc :make clean<CR>
augroup END
