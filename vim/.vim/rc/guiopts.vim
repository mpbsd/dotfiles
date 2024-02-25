" general options {{{
let s:options = {
      \  'term': {
      \    'numberwidth': 6,
      \    'colorcolumn': 80,
      \    'background': 'dark',
      \    'statusline': '%!MyStatusLine()',
      \    'fillchars': 'vert:\|,fold:.,foldsep:\|',
      \  },
      \  'grpx': {
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
      \        'guifont': 'Hack\ Nerd\ Font\ Mono\ 14',
      \    },
      \  },
      \}
" }}}

for [key, val] in items(s:options['term'])
  execute printf("set %s=%s", key, val)
endfor

if has('gui_running')
  for category in keys(s:options['grpx'])
    for [key, val] in items(s:options['grpx'][category])
      if category ==# 'bool'
        let s:cmd = printf("set guioptions %s=%s", val, key)
      elseif category ==# 'misc'
        let s:cmd = printf("set %s=%s", key, val)
      endif
      execute s:cmd
    endfor
  endfor
endif

call ChooseColorschemeAtRandom()
