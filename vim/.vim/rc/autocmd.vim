" foldmethod for vim filetypes {{{
augroup foldmethod_filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" load views {{{
augroup autoload_folds
  autocmd!
  autocmd BufWinLeave *.c,*.h,*.py,*.sh,*.tex mkview
  autocmd BufWinEnter *.c,*.h,*.py,*.sh,*.tex silent! loadview
augroup END
" }}}
" build commands for tex filetypes {{{
augroup latex_build_cmds
  autocmd!
  autocmd FileType tex nnoremap <localleader>mk :make<cr>
  autocmd FileType tex nnoremap <localleader>mb :make bib<cr>
  autocmd FileType tex nnoremap <localleader>mc :make clean<cr>
  autocmd FileType tex nnoremap <localleader>mf :make final<cr>
augroup END
" }}}
" remove trailing spaces {{{
augroup remove_trailing_spaces
  autocmd!
  autocmd BufWrite *.lua,*.py,*.sh,*.tex,*.txt,*.vim :call RemoveTrailingSpaces()
augroup END
" }}}
" load abbreviations {{{
augroup abbreviations
  autocmd!
  autocmd BufWinEnter *.mail,*.md,*.tex,*.txt source ~/.vim/spell/words.abbrev
augroup END
" }}}
" sort word and abbreviation files {{{
augroup sorting_words_list
  autocmd!
  autocmd BufWinEnter *.abbrev,*.dict :%sort u
augroup END
" }}}
