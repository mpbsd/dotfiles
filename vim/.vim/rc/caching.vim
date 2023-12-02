let s:c_dirs_parent_dir = '~/.cache/vim/'

if !isdirectory(s:c_dirs_parent_dir)
  let s:cmd = '!mkdir -p ' . s:c_dirs_parent_dir
  silent! exe s:cmd
endif

let g:netrw_home=s:c_dirs_parent_dir

let s:c_dirs = {'bdir': 'bdir', 'dir': 'sdir', 'udir': 'udir', 'vdir': 'vdir'}

for key_val in items(s:c_dirs)
  let s:key = key_val[0]
  let s:val = key_val[1]
  let s:dir = s:c_dirs_parent_dir . s:val
  let s:cmd = 'set ' . s:key . '=' . s:dir
  if !isdirectory(s:dir)
    silent! exe '!mkdir -p ' . s:dir
  endif
  exe s:cmd
endfor

set vif=~/.cache/vim/.viminfo
