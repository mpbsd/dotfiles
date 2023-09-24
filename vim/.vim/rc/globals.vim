" add the word under the cursor to my own dict file {{{
function SpecialCharactersHandler()
  let l:cw = expand("<cword>") " current word
  let l:pw = expand("<cword>") " parsed word
  let l:pw = substitute(l:pw, "à", "a", "gi")
  let l:pw = substitute(l:pw, "á", "a", "gi")
  let l:pw = substitute(l:pw, "â", "a", "gi")
  let l:pw = substitute(l:pw, "ã", "a", "gi")
  let l:pw = substitute(l:pw, "é", "e", "gi")
  let l:pw = substitute(l:pw, "ê", "e", "gi")
  let l:pw = substitute(l:pw, "í", "i", "gi")
  let l:pw = substitute(l:pw, "ó", "o", "gi")
  let l:pw = substitute(l:pw, "ô", "o", "gi")
  let l:pw = substitute(l:pw, "õ", "o", "gi")
  let l:pw = substitute(l:pw, "ú", "u", "gi")
  let l:pw = substitute(l:pw, "ç", "c", "gi")
  let l:ep = "iabbrev" . " " . pw . " " . cw
  return ep
endfunction

function AddWordUnderCursorToMyAbbreviationsList()
  let l:ep = SpecialCharactersHandler()
  call writefile([ep], expand("~/.vim/spell/words.abbrev"), "a")
  echo "Added '" . ep . "' to ~/.vim/spell/words.abbrev"
endfunction

function AddWordUnderCursorToMyWordsList()
  let l:cw = expand("<cword>")
  call writefile([cw], expand("~/.vim/spell/words.dict"), "a")
  echo "Added '" . cw . "' to ~/.vim/spell/words.dict"
endfunction
" }}}
" remove trailing spaces {{{
function RemoveTrailingSpaces()
  let l:cp = getpos(".")  " cursor position
  let l:re = getreg("/")  " regular expression from last query
  silent %s/\s\+$//e
  call setpos(".", cp)
  call setreg("/", re)
endfunction
" }}}
