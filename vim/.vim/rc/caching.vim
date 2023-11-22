let s:c_dirs_parent_dir = "~/.cache/vim/"

if !isdirectory(s:c_dirs_parent_dir)
  let s:c = "!mkdir -p " . s:c_dirs_parent_dir
  silent! exe c
endif

let g:netrw_home=s:c_dirs_parent_dir

set vif=~/.cache/vim/.viminfo

let s:c_dirs = {"bdir": "bdir", "dir": "sdir", "udir": "udir", "vdir": "vdir"}

for item in items(s:c_dirs)
  let s:k = item[0]
  let s:v = item[1]
  let s:d = s:c_dirs_parent_dir . s:v
  let s:c = 'set ' . s:k . '=' . s:d
  if !isdirectory(s:d)
    silent! exe "!mkdir -p " . s:d
  endif
  exe s:c
endfor
