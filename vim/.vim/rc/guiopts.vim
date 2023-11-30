let s:guiopts = {
      \"bool": {
      \    "d": 1,
      \    "T": 0,
      \    "b": 0,
      \    "l": 0,
      \    "m": 0,
      \    "r": 0
      \},
      \"misc": {
      \    "t_Co": 256,
      \    "guifont": "UbuntuMono\\ Nerd\\ Font\\ Mono\\ 14",
      \    "guiheadroom": 0
      \},
      \}

if has("gui_running")
  for category in keys(s:guiopts)
    for key_value in items(s:guiopts[category])
      let s:k = key_value[0] " key
      let s:v = key_value[1] " value
      if category ==# "bool"
        if s:v == 0
          let s:c = "set guioptions-=" . s:k
        elseif s:v == 1
          let s:c = "set guioptions+=" . s:k
        endif
      elseif category ==# "misc"
        let s:c = "set " . s:k . "=" . s:v
        exe s:c
      endif
      exe s:c
    endfor
  endfor
endif
