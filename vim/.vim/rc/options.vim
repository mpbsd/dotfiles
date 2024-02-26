" s:options {{{
let s:options = {
      \  'bool': {
      \    'number': v:true,
      \    'relativenumber': v:true,
      \    'cursorline': v:true,
      \    'cursorcolumn': v:true,
      \    'expandtab': v:true,
      \    'autoindent': v:true,
      \    'smartindent': v:true,
      \    'linebreak': v:true,
      \    'nojoinspaces': v:true,
      \    'splitright': v:true,
      \    'splitbelow': v:true,
      \    'magic': v:true,
      \    'ignorecase': v:true,
      \    'smartcase': v:true,
      \    'hidden': v:true,
      \    'undofile': v:true,
      \    'lazyredraw': v:true,
      \    'secure': v:true,
      \    'noshowmode': v:true,
      \    'list': v:true,
      \  },
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
      \    'background': 'dark',
      \    'colorcolumn': 80,
      \    'encoding': 'utf8',
      \    'fillchars': 'vert:\|,fold:.,foldsep:\|',
      \    'listchars': 'trail:.,tab:<->,extends:>,precedes:<,nbsp:-',
      \    'numberwidth': 6,
      \    'tabstop': 2,
      \    'shiftwidth': 2,
      \    'spelllang': 'en_us,pt_br',
      \    'spellsuggest': 'fast,15',
      \    'dict': '~/.vim/spell/words.dict',
      \    'statusline': '%!VimSetStatusline()',
      \  },
      \}
" }}}

call VimSetOptions(s:options)
call VimSetColorscheme()
