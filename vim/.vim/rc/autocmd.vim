augroup set_foldmethod_to_marker_for_vimscripts
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup autoload_foldings
  autocmd!
  autocmd BufWinLeave *.c,*.h,*.py,*.sh,*.tex mkview
  autocmd BufWinEnter *.c,*.h,*.py,*.sh,*.tex silent! loadview
augroup END

augroup keybindings_for_building_latex_documents
  autocmd!
  autocmd FileType tex nnoremap <localleader>mk :make<cr>
  autocmd FileType tex nnoremap <localleader>mb :make bib<cr>
  autocmd FileType tex nnoremap <localleader>mc :make clean<cr>
  autocmd FileType tex nnoremap <localleader>mf :make final<cr>
augroup END

augroup remove_trailing_spaces_on_every_save
  autocmd!
  autocmd BufWrite *.lua,*.py,*.sh,*.tex,*.txt,*.vim :call RmTrailingSpaces()
augroup END

augroup load_abbreviations_based_on_the_filetype
  autocmd!
  autocmd BufWinEnter *.md,*.tex,*.txt source ~/.vim/spell/words.abbr
augroup END

augroup enable_spellchecking_and_load_abbreviations_when_writing_emails
  autocmd!
  autocmd FileType mail setlocal spell
  autocmd FileType mail source ~/.vim/spell/words.abbr
augroup END

augroup remove_duplicates_from_my_wording_lists
  autocmd!
  autocmd BufWinEnter words.abbr,words.dict :%sort u
augroup END

