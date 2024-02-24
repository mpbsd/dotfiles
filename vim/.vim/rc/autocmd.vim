augroup set_foldmethod_based_on_the_filetype
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
  autocmd FileType tex nnoremap <leader>mk :make<cr>
  autocmd FileType tex nnoremap <leader>mb :make bib<cr>
  autocmd FileType tex nnoremap <leader>mc :make clean<cr>
  autocmd FileType tex nnoremap <leader>mf :make final<cr>
  autocmd FileType tex inoremap <leader>gc :call GetBibTeXCitationKeys()<cr>
augroup END

augroup remove_trailing_spaces_on_every_save
  autocmd!
  autocmd BufWritePre *.lua,*.py,*.sh,*.tex,*.txt,*.vim :call RmTrailingSpaces()
augroup END

augroup load_abbreviations_based_on_the_filetype
  autocmd!
  autocmd FileType mail setlocal spell
  autocmd FileType mail,markdown,tex,text,vimwiki source ~/.vim/spell/words.abbr
augroup END

augroup remove_duplicates_from_my_wording_lists
  autocmd!
  autocmd BufWinEnter words.abbr,words.dict :%sort u
augroup END

augroup install_missing_plugins
  autocmd!
  autocmd VimEnter * :call InstallMissingPlugins()
augroup END
