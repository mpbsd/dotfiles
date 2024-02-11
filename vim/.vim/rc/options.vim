" general options {{{
let s:options = [
      \  'number',
      \  'relativenumber',
      \  'cursorline',
      \  'cursorcolumn',
      \  'tabstop=2',
      \  'shiftwidth=2',
      \  'expandtab',
      \  'autoindent',
      \  'smartindent',
      \  'linebreak',
      \  'listchars=tab:<->,nbsp:_,trail:.',
      \  'list',
      \  'nojoinspaces',
      \  'splitright',
      \  'splitbelow',
      \  'magic',
      \  'ignorecase',
      \  'smartcase',
      \  'infercase',
      \  'hidden',
      \  'undofile',
      \  'lazyredraw',
      \  'encoding=utf8',
      \  'secure',
      \  'noshowmode',
      \  'dict=~/.vim/spell/words.dict',
      \  'spelllang=en_us,pt_br',
      \  'spellsuggest=fast,10',
      \  'path+=**',
      \]
" }}}

for option in s:options
  let s:cmd = 'set' . ' ' . option
  sil exe s:cmd
endfor
