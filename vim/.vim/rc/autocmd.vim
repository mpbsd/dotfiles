" {{{ set foldmethod=marker for vim filetypes
augroup vim_filetype
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim nnoremap <localleader>s :so %<cr>
augroup END
" }}}
" {{{ autoload views
augroup Folds
  autocmd!
  autocmd BufWinLeave *.c,*.h,*.py,*.sh,*.tex mkview
  autocmd BufWinEnter *.c,*.h,*.py,*.sh,*.tex silent! loadview
augroup END
" }}}
" {{{ create make commands for tex filetypes
augroup LaTeX
  autocmd!
  autocmd FileType tex nnoremap <localleader>m :make<cr>
  autocmd FileType tex nnoremap <localleader>f :make bib<cr>
  autocmd FileType tex nnoremap <localleader>c :make clean<cr>
augroup END
" }}}
