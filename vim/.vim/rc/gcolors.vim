set background=dark

if isdirectory(expand('~/.vim/plugged/seoul256'))
  colorscheme gruvbox
elseif isdirectory(expand('~/.vim/plugged/gruvbox'))
  colorscheme seoul256
else
  colorscheme habamax
endif
