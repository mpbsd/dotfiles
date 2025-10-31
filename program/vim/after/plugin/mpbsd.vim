function! mpbsd#vim_search_for_help_in_new(sp_vs_tb) abort
  if a:sp_vs_tb ==# 'v'
    let l:help_cmd = ':vert help'
  elseif a:sp_vs_tb ==# 't'
    let l:help_cmd = ':tab help'
  else
    let l:help_cmd = ':help'
  endif
  let l:search_for_help = input(':help ')
  execute printf("%s %s", l:help_cmd, l:search_for_help)
endfunction

function! mpbsd#vim_find_help_cword(cword) abort
  execute printf(":tab help %s", a:cword)
endfunction

function! mpbsd#remove_trailing_spaces() abort
  let l:pos = getpos('.')
  let l:reg = getreg('/')
  silent %s/\s\+$//e
  call setpos('.', l:pos)
  call setreg('/', l:reg)
endfunction

function! mpbsd#replace_non_ascii_chars() abort
  let l:ascii_equivalent_chars = {
        \  'à': 'a',
        \  'á': 'a',
        \  'â': 'a',
        \  'ã': 'a',
        \  'ç': 'c',
        \  'é': 'e',
        \  'ê': 'e',
        \  'í': 'i',
        \  'ó': 'o',
        \  'ô': 'o',
        \  'õ': 'o',
        \  'ú': 'u',
        \}
  let l:pos = getpos('.')
  let l:reg = getreg('/')
  for [lhs, rhs] in items(l:ascii_equivalent_chars)
    silent execute printf("1,$s/%s/%s/ge", lhs, rhs)
  endfor
  call setpos('.', l:pos)
  call setreg('/', l:reg)
endfunction

function! mpbsd#toggle_between_true_and_false_values() abort
  let l:CW = expand('<cword>')
  let l:BV = ["true", "false"]
  if index(l:BV, tolower(l:CW)) >= 0
    if l:CW ==# 'True'
      sil exec 'normal ciwFalse'
    elseif l:CW ==# 'true'
      sil exec 'normal ciwfalse'
    elseif l:CW ==# 'False'
      sil exec 'normal ciwTrue'
    elseif l:CW ==# 'false'
      sil exec 'normal ciwtrue'
    endif
  endif
endfunction

function! mpbsd#unicode_seq_to_char() abort
  silent %s/\\u\(\x\{4\}\)/\=nr2char('0x'.submatch(1),1)/ge
endfunction

function! mpbsd#sigaa_students_json() abort
  let l:fn = expand('%')
  let l:r1 = '\<[0-9]\{6\}IME[0-9]\{4\}\.json\>'
  let l:r2 = 'usu.rio \(on\|off\)-line no sigaa'
  let l:r3 = '^\s\+"[0-9]\{9\}": {$'
  if l:fn =~# l:r1 && search(l:r2) > 0 && search(l:r3) == 0
    sil exec 'normal ggguG'
    sil call mpbsd#replace_non_ascii_chars()
    sil exec '1,$s/usuario \(on\|off\)-line no sigaa/\rnome:/g'
    sil exec 'v/^\(nome\|curso\|matricula\|usuario\|e-mail\):/d'
    sil exec '1,$s/\s*enviar mensagem\s*$//'
    sil exec '1,$s/\(^\s\+\|\s\+$\)//e'
    let l:ls = [
          \'nome: \(.*\) (perfil)',
          \'curso: \(.*\)',
          \'matricula: \(.*\)',
          \'usuario: \(.*\)',
          \'e-mail: \(.*\)$',
          \]
    let l:rs = [
          \'"\3": {',
          \'\t"fname": "\1",',
          \'\t"gradc": "\2",',
          \'\t"uname": "\4",',
          \'\t"email": "\5"',
          \'},',
          \]
    sil exec printf('1,$s/%s/%s/', join(l:ls, '$\n^'), join(l:rs, '\r'))
    sil exec 'g/\(marcelo bezerra barboza\|bezerra\|bezerra@ufg.br\)$/d'
    sil exec '1s/^/{\r\t/'
    sil exec '$s/$/\r}/'
    sil exec '1,$s/},$\n^}/}\r}/'
    sil exec 'normal gg=G'
  else
    echo 'Does not match criteria for code execution'
  endif
endfunction

function! mpbsd#ime_servers() abort
  let l:subscmd = {
        \ 'lhs': [
        \   '^"\([0-9]\{5,\}\)"',
        \   '"\([^"]\+\)"',
        \   '"\([^"]\+\)"',
        \   '"\([^"]\+\)"',
        \   '"\%([^"]*\)"',
        \   '"\([^"]\+\)"',
        \   '"\([^"]\+\)"',
        \   '"\([^"]\+\)"',
        \   '"\%([^"]*\)"',
        \   '"\([^"]\+\)"',
        \   '"\([^"]\+\)"$',
        \  ],
        \ 'rhs': [
        \   '"\1": {"',
        \   '"fname": "\2"',
        \   '"birth": "\3"',
        \   '"ignit": "\4"',
        \   '"funct": "\5"',
        \   '"categ": "\6"',
        \   '"degre": "\7"',
        \   '"regim": "\8"',
        \   '"afair": "\9"',
        \   '"break": "[]"',
        \   '"patch": "[]"\r},',
        \  ],
        \}
  sil exec 'norm ggd17j'
  sil exec 'norm ggguG'
  sil %s/\v(^|$)/"/g
  sil %s/,/","/g
  sil %s/\s\+","/","/g
  let l:lhs = join(l:subscmd['lhs'], ',')
  let l:rhs = join(l:subscmd['rhs'], ',\r')
  sil exec printf("1,$s/%s/%s/", l:lhs, l:rhs)
  sil %s/{",$/{/
  sil 1s/^/{\r/
  sil $s/},$/}\r}/
  sil exec 'norm gg=G'
endfunction

function! mpbsd#sampa_scalar() abort
  let l:fn = expand('%')
  let l:r1 = '\<scalar\.txt\>'
  let l:r2 = '(X0\%(, X[0-9]\+\)\+)'
  if l:fn =~# l:r1 && search(l:r2) > 0
    silent %s/\.0\%(\*\)\@=//g
    silent %s/\%(U[0-9]\+\)\@<=(X0\%(, X[0-9]\+\)\+)//g
    silent %s/ \([+-]\) /\r\1/g
    silent g/Derivative(U[0-9]\+, (X[0-9]\+, 2))$/m$
    silent g/Derivative(U[0-9]\+, X[0-9]\+)\*\*2$/m$
    silent g/Derivative(U[0-9]\+, X[0-9]\+)\*Derivative(U[0-9]\+, X[0-9]\+)/m$
    silent g/(X[0-9]\+, 2))$\n^.*\*\*2/s/$/\r/
    silent g/\*\*2$\n^.*Derivative(U[0-9]\+, X[0-9]\+)\*Derivative/s/$/\r/
  else
    echo 'Does not match criteria for code execution'
  endif
endfunction
