augroup latex_editing_made_easy
  autocmd!
  autocmd FileType tex {
    setlocal spell
    setlocal foldmethod=marker
    nnoremap <LocalLeader>1 :Eintroduction<CR>
    nnoremap <LocalLeader>2 :Eresults<CR>
    nnoremap <LocalLeader>3 :Eexamples<CR>
    nnoremap <LocalLeader>4 :Eproofs<CR>
    nnoremap <LocalLeader>5 :Ebibliography<CR>
    nnoremap <LocalLeader>f :Make draft<CR>
    nnoremap <LocalLeader>d :Make final<CR>
    nnoremap <LocalLeader>c :Make clean<CR>
  }
  autocmd BufWritePre *.tex :call mpbsd#vim_rm_trailing_spaces_from_cbuffer()
augroup END
