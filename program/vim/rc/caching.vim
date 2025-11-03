if !isdirectory(g:netrw_home)
  silent execute printf("!mkdir -p %s", g:netrw_home)
endif

execute printf("set viminfofile=%s/.viminfo", g:netrw_home)

let s:dirs = {
      \  'backupdir': 'bdir',
      \  'directory': 'sdir',
      \  'undodir'  : 'udir',
      \  'viewdir'  : 'vdir',
      \}

for [lhs, rhs] in items(s:dirs)
  let s:dir = printf("%s/%s", g:netrw_home, rhs)
  if !isdirectory(s:dir)
    silent execute printf("!mkdir -p %s", s:dir)
  endif
  execute printf("set %s=%s", lhs, s:dir)
endfor
