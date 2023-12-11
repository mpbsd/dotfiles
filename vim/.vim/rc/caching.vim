let s:c_dirs_parent_dir = glob('~/.cache/vim/')

if empty(s:c_dirs_parent_dir)
  let s:cmd = '!mkdir -p ' . s:c_dirs_parent_dir
  silent! exe s:cmd
endif

let g:netrw_home=s:c_dirs_parent_dir

let s:c_dirs = {'bdir': 'bdir', 'dir': 'sdir', 'udir': 'udir', 'vdir': 'vdir'}

for [key, val] in items(s:c_dirs)
  let s:dir = s:c_dirs_parent_dir . val
  let s:cmd = 'set ' . key . '=' . s:dir
  if empty(s:dir)
    silent! exe '!mkdir -p ' . s:dir
  endif
  exe s:cmd
endfor

set vif=~/.cache/vim/.viminfo
