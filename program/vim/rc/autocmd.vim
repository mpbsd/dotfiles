augroup awesome_latex
  autocmd!
  autocmd FileType tex set nowrap
  autocmd FileType tex setlocal foldmethod=marker
  autocmd FileType tex setlocal spell
  autocmd FileType tex nnoremap <Leader>md :make draft<CR>
  autocmd FileType tex nnoremap <Leader>mf :make final<CR>
  autocmd FileType tex nnoremap <Leader>mc :make clean<CR>
  autocmd BufWritePre *.tex :call globals#vim_rm_trailing_spaces_from_cbuffer()
augroup END

augroup awesome_csv
  autocmd!
  autocmd FileType csv set nowrap
  autocmd BufWritePre *.csv :Tab /[,;]<CR>
augroup END

augroup awesome_emailing
  autocmd!
  autocmd FileType mail setlocal spell
augroup END

augroup set_foldmethod_to_marker_for_these_filetypes
  autocmd!
  autocmd FileType c,h,python,sh,vim setlocal foldmethod=marker
augroup END

augroup get_rid_of_trailing_spaces
  autocmd!
  autocmd BufWritePre *.json,*.lua,*.py,*.sh,*.txt,*.vim :call globals#vim_rm_trailing_spaces_from_cbuffer()
augroup END
