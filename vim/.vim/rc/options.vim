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
      \  'nojoinspaces',
      \  'splitright',
      \  'splitbelow',
      \  'magic',
      \  'ignorecase',
      \  'smartcase',
      \  'hidden',
      \  'undofile',
      \  'lazyredraw',
      \  'encoding=utf8',
      \  'secure',
      \  'noshowmode',
      \  'dict=~/.vim/spell/words.dict',
      \  'spelllang=en_us,pt_br',
      \  'spellsuggest=fast,15',
      \  'path+=**',
      \  'listchars=trail:.,tab:<->,extends:>,precedes:<,nbsp:-',
      \  'list',
      \]
" }}}

for option in s:options
  execute printf("set %s", option)
endfor
