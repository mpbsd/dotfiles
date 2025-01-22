function! snips#vim_try_insert_skeleton(skel) abort
  execute "normal! i_" . a:skel . "\<C-R>=UltiSnips#ExpandSnippet()\<CR>"

  if g:ulti_expand_res == 0
    silent! undo
  endif
  return g:ulti_expand_res
endfunction

function! snips#vim_insert_skeleton() abort
  let l:filename = expand('%')
  if !(line('$') == 1 && getline('$') == '') || filereadable(l:filename)
    return 
  endif
  if !empty('b:projectionist')
    for [root, value] in projectionist#query('skeleton')
      if snips#vim_try_insert_skeleton(value)
        return
      endif
    endfor
  endif
  call snips#vim_try_insert_skeleton('skel')
endfunction

augroup template_projectionist_ultisnips
  autocmd!
  autocmd User ProjectionistActivate silent call snips#vim_insert_skeleton()
  autocmd BufNewFile * silent call snips#vim_insert_skeleton()
augroup END
