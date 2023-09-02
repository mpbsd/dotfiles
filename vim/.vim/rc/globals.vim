function AddWordUnderCursorToWordsList()
  let l:cw = expand("<cword>")
  call writefile([cw], "/home/marcelo/.vim/dict/words.txt", "a")
  echo 'Added ' . cw . 'to ~/.vim/dict/words.txt'
endfunction
