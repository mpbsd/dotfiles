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

function! mpbsd#toggle_between_opposite_values() abort
  let l:CW = expand('<cword>')
  let l:BV = ['true', 'false', 'yes', 'no']
  if index(l:BV, tolower(l:CW)) >= 0
    if l:CW ==# 'True'
      silent execute 'normal ciwFalse'
    elseif l:CW ==# 'true'
      silent execute 'normal ciwfalse'
    elseif l:CW ==# 'False'
      silent execute 'normal ciwTrue'
    elseif l:CW ==# 'false'
      silent execute 'normal ciwtrue'
    elseif l:CW ==# 'Yes'
      silent execute 'normal ciwNo'
    elseif l:CW ==# 'yes'
      silent execute 'normal ciwno'
    elseif l:CW ==# 'No'
      silent execute 'normal ciwYes'
    elseif l:CW ==# 'no'
      silent execute 'normal ciwyes'
    endif
  endif
endfunction

function! mpbsd#toggle_between_opposite_signs() abort
  let l:SV = ['+', '-']
  silent execute 'normal "ayl'
  if index(l:SV, @a) >= 0
    if @a ==# '+'
      silent execute 'normal s-'
    elseif @a ==# '-'
      silent execute 'normal s+'
    endif
  endif
endfunction

function! mpbsd#unicode_seq_to_char() abort
  silent %s/\\u\(\x\{4\}\)/\=nr2char('0x'.submatch(1),1)/ge
endfunction

function! mpbsd#students_sigaa() abort
  let l:fn = expand('%')
  let l:r1 = '\<[0-9]\{6\}IME[0-9]\{4\}\.json\>'
  let l:r2 = 'usu.rio \(on\|off\)-line no sigaa'
  let l:r3 = '^\s\+"[0-9]\{9\}": {$'
  if l:fn =~# l:r1 && search(l:r2) > 0 && search(l:r3) == 0
    silent execute 'normal ggguG'
    sil call mpbsd#replace_non_ascii_chars()
    silent execute '1,$s/usuario \(on\|off\)-line no sigaa/\rnome:/g'
    silent execute 'v/^\(nome\|curso\|matricula\|usuario\|e-mail\):/d'
    silent execute '1,$s/\s*enviar mensagem\s*$//'
    silent execute '1,$s/\(^\s\+\|\s\+$\)//e'
    let l:subscmd = {
          \  'lhs': [
          \    'nome: \(.*\) (perfil)',
          \    'curso: \(.*\)',
          \    'matricula: \(.*\)',
          \    'usuario: \(.*\)',
          \    'e-mail: \(.*\)$',
          \  ],
          \ 'rhs': [
          \    '"\3": {',
          \    '\t"fname": "\1",',
          \    '\t"gradc": "\2",',
          \    '\t"uname": "\4",',
          \    '\t"email": "\5"',
          \    '},',
          \  ],
          \}
    let l:lhs = join(l:subscmd['lhs'], '$\n^')
    let l:rhs = join(l:subscmd['rhs'], '\r')
    silent execute printf('1,$s/%s/%s/', l:lhs, l:rhs)
    silent execute 'g/\(marcelo bezerra barboza\|bezerra\|bezerra@ufg.br\)$/d'
    silent execute '1s/^/{\r\t/'
    silent execute '$s/$/\r}/'
    silent execute '1,$s/},$\n^}/}\r}/'
    silent execute 'normal gg=G'
  else
    echo 'Does not match criteria for code execution'
  endif
endfunction

function! mpbsd#staff_ime() abort
  let l:fn = expand('%')
  let l:r1 = '\<staff_ime\.json\>'
  let l:r2 = 'DEMONSTRATIVO DE PESSOAL LOTADO'
  let l:r3 = 'INSTITUTO DE MATEMÁTICA E ESTATÍSTICA'
  if l:fn =~# l:r1 && search(l:r2) > 0 && search(l:r3) > 0
    let l:subscmd = {
          \  'lhs': [
          \    '^"\([0-9]\{5,\}\)"',
          \    '"\([^"]\+\)"',
          \    '"\([^"]\+\)"',
          \    '"\([^"]\+\)"',
          \    '"\%([^"]*\)"',
          \    '"\([^"]\+\)"',
          \    '"\([^"]\+\)"',
          \    '"\([^"]\+\)"',
          \    '"\%([^"]*\)"',
          \    '"\([^"]\+\)"',
          \    '"\([^"]\+\)"$',
          \  ],
          \  'rhs': [
          \    '"\1": {"',
          \    '"fname": "\2"',
          \    '"birth": "\3"',
          \    '"ignit": "\4"',
          \    '"funct": "\5"',
          \    '"categ": "\6"',
          \    '"degre": "\7"',
          \    '"regim": "\8"',
          \    '"afair": "\9"',
          \    '"break": "[]"',
          \    '"patch": "[]"\r},',
          \  ],
          \}
    silent execute 'norm ggd17j'
    silent execute 'norm ggguG'
    call mpbsd#replace_non_ascii_chars()
    sil %s/\v(^|$)/"/g
    sil %s/,/","/g
    sil %s/\s\+","/","/g
    let l:lhs = join(l:subscmd['lhs'], ',')
    let l:rhs = join(l:subscmd['rhs'], ',\r')
    silent execute printf("1,$s/%s/%s/", l:lhs, l:rhs)
    sil %s/{",$/{/
    sil 1s/^/{\r/
    sil $s/},$/}\r}/
    silent execute 'norm gg=G'
    set fileformat=unix
  else
    echo 'Does not match criteria for code execution'
  endif
endfunction
