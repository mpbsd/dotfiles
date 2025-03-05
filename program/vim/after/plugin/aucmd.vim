augroup mpbsd_csv
  autocmd!
  autocmd FileType csv setlocal nowrap
augroup END

augroup mpbsd_mailing
  autocmd!
  autocmd FileType mail setlocal spell
augroup END

augroup mpbsd_fdm
  autocmd!
  autocmd FileType c      setlocal foldmethod=marker
  autocmd FileType h      setlocal foldmethod=marker
  autocmd FileType lua    setlocal foldmethod=marker
  autocmd FileType python setlocal foldmethod=marker
  autocmd FileType sh     setlocal foldmethod=marker
  autocmd FileType tex    setlocal foldmethod=marker
  autocmd FileType vim    setlocal foldmethod=marker
augroup END

augroup mpbsd_trailing_spaces
  autocmd!
  autocmd BufWritePre *.c    :call mpbsd#remove_trailing_spaces()
  autocmd BufWritePre *.h    :call mpbsd#remove_trailing_spaces()
  autocmd BufWritePre *.json :call mpbsd#remove_trailing_spaces()
  autocmd BufWritePre *.lua  :call mpbsd#remove_trailing_spaces()
  autocmd BufWritePre *.py   :call mpbsd#remove_trailing_spaces()
  autocmd BufWritePre *.sh   :call mpbsd#remove_trailing_spaces()
  autocmd BufWritePre *.tex  :call mpbsd#remove_trailing_spaces()
  autocmd BufWritePre *.txt  :call mpbsd#remove_trailing_spaces()
  autocmd BufWritePre *.vim  :call mpbsd#remove_trailing_spaces()
augroup END

augroup mpbsd_latexing
  autocmd!
  autocmd FileType tex {
    setlocal spell
    nnoremap <LocalLeader>f :Make draft<CR>
    nnoremap <LocalLeader>d :Make final<CR>
    nnoremap <LocalLeader>c :Make clean<CR>
  }
augroup END
