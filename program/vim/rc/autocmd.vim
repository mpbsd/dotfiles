augroup set_foldmethod_to_marker_for_these_filetypes
  autocmd!
  autocmd FileType c,h,python,sh,vim setlocal foldmethod=marker
augroup END

augroup point_out_misspelled_words_in_mails_and_tex_files
  autocmd!
  autocmd FileType mail,tex setlocal spell
augroup END

augroup nowrap_csv_file
  autocmd!
  autocmd FileType csv set nowrap
augroup END

augroup get_rid_of_trailing_spaces
  autocmd!
  autocmd BufWritePre *.json,*.lua,*.py,*.sh,*.tex,*.txt,*.vim :call globals#vim_rm_trailing_spaces_from_cbuffer()
augroup END
