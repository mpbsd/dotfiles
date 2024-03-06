let s:cache_dir = expand('~/.cache/vim')

if !isdirectory(s:cache_dir)
  sil exe printf("!mkdir -p %s", s:cache_dir)
endif

exe printf("set vif=%s/.viminfo", s:cache_dir)

let g:netrw_home=s:cache_dir

let s:dirs = {
      \  'backupdir': 'bdir',
      \  'directory': 'sdir',
      \  'undodir': 'udir',
      \  'viewdir': 'vdir',
      \}

for [lhs, rhs] in items(s:dirs)
  let s:dir = printf("%s/%s", s:cache_dir, rhs)
  if !isdirectory(s:dir)
    sil exe printf("!mkdir -p %s", s:dir)
  endif
  exe printf("set %s=%s", lhs, s:dir)
endfor
