set background=dark

if empty(glob('~/.vim/plugged/seoul256'))
  colorscheme seoul256
else
  if isdirectory(expand('~/.vim/plugged/gruvbox'))
    colorscheme gruvbox
  else
    colorscheme habamax
  endif
endif
