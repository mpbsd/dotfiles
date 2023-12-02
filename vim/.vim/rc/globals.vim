let g:tex_flavor='latex'

function SpecialCharactersHandler()
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
  let l:abbrv = 'abbrv' . ' ' . l:pword . ' ' . l:cword
  return l:abbrv
endfunction

function AddWordUnderCursorToMyAbbreviationsList()
  let l:abbrv = SpecialCharactersHandler()
  call writefile([l:abbrv], expand('~/.vim/spell/words.abbrev'), 'a')
  echo 'Added ''' . l:abbrv . ''' to ~/.vim/spell/words.abbrev'
endfunction

function AddWordUnderCursorToMyWordsList()
  let l:cword = expand('<cword>')
  call writefile([l:cword], expand('~/.vim/spell/words.dict'), 'a')
  echo 'Added ''' . l:cword . ''' to ~/.vim/spell/words.dict'
endfunction

function RmTrailingSpaces()
  let l:cp = getpos('.')
  let l:re = getreg('/')
  silent %s/\s\+$//e
  call setpos('.', l:cp)
  call setreg('/', l:re)
endfunction
