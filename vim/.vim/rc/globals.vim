let g:tex_flavor = 'latex'

function SpecialCharactersHandler() abort
  let l:cword = expand('<cword>')
  let l:pword = expand('<cword>')
  let l:pword = substitute(l:pword, 'à', 'a', 'gi')
  let l:pword = substitute(l:pword, 'á', 'a', 'gi')
  let l:pword = substitute(l:pword, 'â', 'a', 'gi')
  let l:pword = substitute(l:pword, 'ã', 'a', 'gi')
  let l:pword = substitute(l:pword, 'é', 'e', 'gi')
  let l:pword = substitute(l:pword, 'ê', 'e', 'gi')
  let l:pword = substitute(l:pword, 'í', 'i', 'gi')
  let l:pword = substitute(l:pword, 'ó', 'o', 'gi')
  let l:pword = substitute(l:pword, 'ô', 'o', 'gi')
  let l:pword = substitute(l:pword, 'õ', 'o', 'gi')
  let l:pword = substitute(l:pword, 'ú', 'u', 'gi')
  let l:pword = substitute(l:pword, 'ç', 'c', 'gi')
  let l:abbrv = 'iabbrev' . ' ' . l:pword . ' ' . l:cword
  return l:abbrv
endfunction

function AddWordUnderCursorToMyAbbreviationsList() abort
  let l:abbrv = SpecialCharactersHandler()
  cal writefile([l:abbrv], expand('~/.vim/spell/words.abbr'), 'a')
  echo 'Added ''' . l:abbrv . ''' to ~/.vim/spell/words.abbr'
endfunction

function AddWordUnderCursorToMyWordsList() abort
  let l:cword = expand('<cword>')
  cal writefile([l:cword], expand('~/.vim/spell/words.dict'), 'a')
  echo 'Added ''' . l:cword . ''' to ~/.vim/spell/words.dict'
endfunction

function RmTrailingSpaces() abort
  let l:pos = getpos('.')
  let l:reg = getreg('/')
  sil %s/\s\+$//e
  cal setpos('.', l:pos)
  cal setreg('/', l:reg)
endfunction

function BetterSubstitution() abort
  let l:pos = getpos('.')
  let l:cmd = '%s/' . expand('<cword>') . '/' . getreg('0') . '/g'
  sil exe l:cmd
  cal setpos('.', l:pos)
endfunction

function InstallMissingPlugins() abort
  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    PlugInstall --sync
  endif
endfunction
