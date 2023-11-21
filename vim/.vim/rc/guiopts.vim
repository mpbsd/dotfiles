let s:guiopt = {
      \"bool": {
      \"d": 1,
      \"T": 0,
      \"b": 0,
      \"l": 0,
      \"m": 0,
      \"r": 0
      \},
      \"misc": {
      \"t_Co": 256,
      \"guifont": "SauceCodePro\\ Nerd\\ Font\\ Mono\\ 12",
      \"guiheadroom": 0
      \}
      \}

if has("gui_running")
  for opt in items(s:guiopt["bool"])
    let s:k = opt[0]
    let s:v = opt[1]
    if s:v == 0
      let s:c = "set guioptions-=" . s:k
    elseif s:v == 1
      let s:c = "set guioptions+=" . s:k
    endif
    exe s:c
  endfor
  for opt in items(s:guiopt["misc"])
    let s:k = opt[0]
    let s:v = opt[1]
    let s:c = "set " . s:k . "=" . s:v
    exe s:c
  endfor
endif
