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
  autocmd FileType c,h,python,sh,tex,vim setlocal foldmethod=marker
augroup END

augroup mpbsd_trailing_spaces
  autocmd!
  let s:filetype = [
        \'json',
        \'lua',
        \'py',
        \'sh',
        \'tex',
        \'txt',
        \'vim',
        \]
  for ft in s:filetype
    autocmd BufWritePre '*.' . ft :call mpbsd#vim_rm_trailing_spaces_from_cbuffer()
  endfor
augroup END

augroup mpbsd_latexing
  autocmd!
  autocmd FileType tex {
    setlocal spell
    nnoremap <LocalLeader>1 :Eintroduction<CR>
    nnoremap <LocalLeader>2 :Eresults<CR>
    nnoremap <LocalLeader>3 :Eexamples<CR>
    nnoremap <LocalLeader>4 :Eproofs<CR>
    nnoremap <LocalLeader>5 :Ebibliography<CR>
    nnoremap <LocalLeader>f :Make draft<CR>
    nnoremap <LocalLeader>d :Make final<CR>
    nnoremap <LocalLeader>c :Make clean<CR>
  }
augroup END
