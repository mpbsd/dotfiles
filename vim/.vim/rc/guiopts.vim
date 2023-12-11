let s:guiopts = {
      \'bool': {
      \    'd': '+',
      \    'T': '-',
      \    'b': '-',
      \    'l': '-',
      \    'm': '-',
      \    'r': '-',
      \},
      \'misc': {
      \    't_Co': 256,
      \    'guifont': "UbuntuMono\\ Nerd\\ Font\\ Mono\\ 14",
      \    'guiheadroom': 0
      \},
      \}

if has('gui_running')
  for category in keys(s:guiopts)
    for [key, val] in items(s:guiopts[category])
      if category ==# 'bool'
        let s:cmd = 'set guioptions' . val . '=' . key
      elseif category ==# 'misc'
        let s:cmd = 'set ' . key . '=' . val
      endif
      exe s:cmd
    endfor
  endfor
endif
