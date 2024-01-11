" general options {{{
let s:options = {
      \'term': {
      \    'numberwidth': 6,
      \    'colorcolumn': 80,
      \    'background': 'dark',
      \    'statusline': "[\%n]\\ \%f\\ \%m\%=\%{&fenc}\\ \%{&ff}\\ \%Y\\ (\%06l,\%06v)",
      \    'fillchars': "vert:\\|,fold:.,foldsep:\\|",
      \},
      \'grpx': {
      \    'bool': {
      \        'd': '+',
      \        'T': '-',
      \        'b': '-',
      \        'l': '-',
      \        'm': '-',
      \        'r': '-',
      \    },
      \    'misc': {
      \        't_Co': 256,
      \        'guiheadroom': 0,
      \        'guifont': "JetBrainsMono\\ Nerd\\ Font\\ Mono\\ 16",
      \    },
      \},
      \}
" }}}

for [key, val] in items(s:options['term'])
  let s:cmd = 'set' . ' ' . key . '=' . val
  exe s:cmd
endfor

if has('gui_running')
  for category in keys(s:options['grpx'])
    for [key, val] in items(s:options['grpx'][category])
      if category ==# 'bool'
        let s:cmd = 'set guioptions' . val . '=' . key
      elseif category ==# 'misc'
        let s:cmd = 'set' . ' ' . key . '=' . val
      endif
      exe s:cmd
    endfor
  endfor
endif

if empty(glob('~/.vim/plugged/gruvbox/'))
  colorscheme habamax
else
  colorscheme gruvbox
endif
