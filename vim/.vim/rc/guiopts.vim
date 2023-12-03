let s:guiopts = {
      \'bool': {
      \    'd': 1,
      \    'T': 0,
      \    'b': 0,
      \    'l': 0,
      \    'm': 0,
      \    'r': 0
      \},
      \'misc': {
      \    't_Co': 256,
      \    'guifont': "UbuntuMono\\ Nerd\\ Font\\ Mono\\ 14",
      \    'guiheadroom': 0
      \},
      \}

if has('gui_running')
  for category in keys(s:guiopts)
    for key_val in items(s:guiopts[category])
      let s:key = key_val[0]
      let s:val = key_val[1]
      if category ==# 'bool'
        if s:val == 0
          let s:cmd = 'set guioptions-=' . s:key
        elseif s:val == 1
          let s:cmd = 'set guioptions+=' . s:key
        endif
      elseif category ==# 'misc'
        let s:cmd = 'set ' . s:key . '=' . s:val
        exe s:cmd
      endif
      exe s:cmd
    endfor
  endfor
endif
