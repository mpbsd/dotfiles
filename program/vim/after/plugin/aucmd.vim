augroup awesome_csv
  autocmd!
  autocmd FileType csv setlocal nowrap
augroup END

augroup awesome_emailing
  autocmd!
  autocmd FileType mail setlocal spell
augroup END

augroup set_foldmethod_to_marker_for_these_filetypes
  autocmd!
  autocmd FileType c,h,python,sh,vim setlocal foldmethod=marker
augroup END

augroup remove_trailing_spaces_based_on_filetype
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
augroup END
