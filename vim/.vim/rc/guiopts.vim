" general options {{{
let s:options = {
      \  'grpx': {
      \    'T': '-',
      \    'b': '-',
      \    'd': '+',
      \    'l': '-',
      \    'm': '-',
      \    'r': '-',
      \  },
      \  'misc': {
      \    't_Co': 256,
      \    'guiheadroom': 0,
      \    'guifont': 'Hack\ Nerd\ Font\ Mono\ 14',
      \  },
      \  'term': {
      \    'numberwidth': 6,
      \    'colorcolumn': 80,
      \    'background': 'dark',
      \    'statusline': '%!MyStatusLine()',
      \    'fillchars': 'vert:\|,fold:.,foldsep:\|',
      \  },
      \}
" }}}

function AssignmentOperation(categ, lhs, rhs) abort
  if a:categ ==# 'grpx'
    let l:assignment = printf("set guioptions %s=%s", a:rhs, a:lhs)
  else
    let l:assignment = printf("set %s=%s", a:lhs, a:rhs)
  endif
  return l:assignment
endfunction

for categ in keys(s:options)
  for [lhs, rhs] in items(s:options[categ])
    execute AssignmentOperation(categ, lhs, rhs)
  endfor
endfor

call ChooseColorschemeAtRandom()
