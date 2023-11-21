" sets bdir, dir, udir, vdir
let s:c_dirs = {"bdir": "bdir", "dir": "sdir", "udir": "udir", "vdir": "vdir"}
let s:c_dirs_parent_dir = "~/.cache/vim/"

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

" sets netrw_home
if !isdirectory('~/.cache/vim')
  silent! exe "!mkdir -p ~/.cache/vim"
endif
let g:netrw_home='~/.cache/vim/'

set vif=~/.cache/vim/.viminfo
