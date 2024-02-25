let s:cache_dir = expand('~/.cache/vim/')

if !isdirectory(s:cache_dir)
  let s:cmd = join(['!mkdir -p', s:cache_dir])
  sil! exe s:cmd
endif

let g:netrw_home=s:cache_dir

let s:dirs = {'bdir': 'bdir', 'dir': 'sdir', 'udir': 'udir', 'vdir': 'vdir'}

for [key, val] in items(s:dirs)
  let s:dir = s:cache_dir . val
  let s:cmd = join(['set ', key, '=', s:dir], '')
  if !isdirectory(s:dir)
    let s:mkd = join(['!mkdir -p', s:dir])
    sil! exe s:mkd
  endif
  exe s:cmd
endfor

set vif=~/.cache/vim/.viminfo
