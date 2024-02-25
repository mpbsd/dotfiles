let s:cache_dir = expand('~/.cache/vim')

if !isdirectory(s:cache_dir)
  silent execute printf("!mkdir -p %s", s:cache_dir)
endif

execute printf("set vif=%s/.viminfo", s:cache_dir)

let g:netrw_home=s:cache_dir

let s:dirs = {'bdir': 'bdir', 'dir': 'sdir', 'udir': 'udir', 'vdir': 'vdir'}

for [key, val] in items(s:dirs)
  let s:dir = printf("%s/%s", s:cache_dir, val)
  if !isdirectory(s:dir)
    silent execute printf("!mkdir -p %s", s:dir)
  endif
  execute printf("set %s=%s", key, s:dir)
endfor
