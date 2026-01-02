augroup mpbsd_nowrap
  autocmd!
  autocmd FileType csv setlocal nowrap
augroup END

augroup mpbsd_email
  autocmd!
  autocmd FileType mail {
    setlocal spell
  }
augroup END

augroup mpbsd_fdm
  autocmd!
  autocmd FileType c      setlocal foldmethod=marker
  autocmd FileType h      setlocal foldmethod=marker
  autocmd FileType lua    setlocal foldmethod=marker
  autocmd FileType python setlocal foldmethod=marker
  autocmd FileType ruby   setlocal foldmethod=marker
  autocmd FileType sh     setlocal foldmethod=marker
  autocmd FileType tex    setlocal foldmethod=marker
  autocmd FileType vim    setlocal foldmethod=marker
augroup END

augroup mpbsd_trailing_spaces
  autocmd!
  autocmd BufWritePre *.c    :call mpbsd#remove_trailing_spaces()
  autocmd BufWritePre *.csv  :call mpbsd#remove_trailing_spaces()
  autocmd BufWritePre *.h    :call mpbsd#remove_trailing_spaces()
  autocmd BufWritePre *.json :call mpbsd#remove_trailing_spaces()
  autocmd BufWritePre *.lua  :call mpbsd#remove_trailing_spaces()
  autocmd BufWritePre *.py   :call mpbsd#remove_trailing_spaces()
  autocmd BufWritePre *.rb   :call mpbsd#remove_trailing_spaces()
  autocmd BufWritePre *.sh   :call mpbsd#remove_trailing_spaces()
  autocmd BufWritePre *.tex  :call mpbsd#remove_trailing_spaces()
  autocmd BufWritePre *.txt  :call mpbsd#remove_trailing_spaces()
  autocmd BufWritePre *.vim  :call mpbsd#remove_trailing_spaces()
augroup END

augroup mpbsd_latex
  autocmd!
  autocmd FileType tex {
    setlocal spell
    nnoremap <LocalLeader>ea :Earticle<CR>
    nnoremap <LocalLeader>eb :Ebibliography<CR>
    nnoremap <LocalLeader>ei :Eintroduction<CR>
    nnoremap <LocalLeader>em :Emakefile<CR>
    nnoremap <LocalLeader>er :Eresults<CR>
    nnoremap <LocalLeader>ee :Eexamples<CR>
    nnoremap <LocalLeader>ep :Eproofs<CR>
    nnoremap <LocalLeader>mc :Make clean<CR>
    nnoremap <LocalLeader>md :Make draft<CR>
    nnoremap <LocalLeader>mf :Make final<CR>
  }
augroup END

augroup mpbsd_ledger
  autocmd!
  autocmd BufWritePre *.ledger :call mpbsd#format_ledger_file()
augroup END

augroup mpbsd_sigaa
  autocmd!
  autocmd BufWritePre *.json :call mpbsd#students_sigaa()
augroup END

augroup mpbsd_staff
  autocmd!
  autocmd BufWritePre *.json :call mpbsd#staff_ime()
augroup END
