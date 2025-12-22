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

function! mpbsd#rgcg() abort
  let l:rule = [
        \ '^\(\%(art\.\|§\) *\%([1-9][ºo]\|[0-9]\{2,\}\.\?\)',
        \ 'par[aá]grafo [uú]nico\.\?',
        \ '[ivxlcdm]\+\s*[.-]\s*\)$'
        \]
  let l:proc = '\<[0-9]\{5\}\.[0-9]\{6\}\/[0-9]\{4\}-[0-9]\{2\}\>'
  let l:line = [
        \ '^goi[aâ]nia, [0-9]\{1,2\} de [a-zç]\+ de [0-9]\{4\}\.\?$',
        \ '^regulamento geral dos cursos de graduação (rgcg)$'
        \]
  let l:MEAN = [
        \ '\%((mge) será obtida pela seguinte fórmula: \)\@<=',
        \ '.*',
        \ '\%( em que:\)\@=',
        \ '\\\[MGE=\\frac{\\sum_{i=1}^{N}CHD_{i}ND_{i}}',
        \ '{\\sum_{i=1}^{N}CHD_{i}}\\\]'
        \]
  let l:mge0 = l:MEAN[0] . l:MEAN[1] . l:MEAN[2]
  let l:mge1 = l:MEAN[3] . l:MEAN[4]
  let l:artg = [
        \ '^\(art\. \+\%([1-9][ºo]\|[0-9]\{2,\}\.\?\)\)$\n^\(.*\)$',
        \ '\\begin{artigo}\\label{\1}\r\2\r\\end{artigo}'
        \]
  let l:parg = [
        \ '^\(§ \+\%([1-9][ºo]\|[0-9]\{2,\}\.\?\)\)$\n^\(.*\)$',
        \ '\\begin{paragrafo}\\label{\1}\r\2\r\\end{paragrafo}'
        \]
  let l:uniq = [
        \ '^parágrafo único\.\?$\n^\s*\(.*\)$',
        \ '\\begin{paragrafounico}\r\1\r\\end{paragrafounico}'
        \]
  " command execution starts here
  silent %s/^ *[0-9*]\+ *$//ge
  silent execute printf("g/./:/%s/+1;/^$/-1join", join(l:rule, '\|'))
  silent execute printf("1,/%s/-1d", l:proc)
  silent execute printf("/%s/;/%s/d", l:line[0], l:line[1])
  silent %s/R E S O L V E:/\\begin{document}/
  silent $s/$/\\end{document}/
  silent g/\(^$\n^$\)\+/d
  silent %s/–/-/ge
  silent %s/%/\\\%/ge
  silent %s/IP *= *100\*TA *+ *10\*TI *- *3\*QR/\\\[IP=100TA+10TI-3QR\\\]/
  silent execute printf("1,$s/%s/%s/", l:mge0, l:mge1)
  silent execute printf("1,$s/%s/%s/", l:artg[0], l:artg[1])
  silent execute printf("1,$s/%s/%s/", l:parg[0], l:parg[1])
  silent execute printf("1,$s/%s/%s/", l:uniq[0], l:uniq[1])
endfunction

function! mpbsd#staff_ime() abort
  let l:fn = expand('%')
  let l:r1 = '\<staff\.json\>'
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
          \    '"usual": []',
          \    '"break": []',
          \    '"patch": []\r},',
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

function! mpbsd#format_distinct_configurations() abort
  silent %s/), (/\r),\r(/eg
  silent %s/(\[/(\r\t\[/e
  silent %s/\], \[/\],\r\t\[/eg
  silent %s/^\[(/(/e
  silent %s/)\]$/\r)/e
  silent %s/\%(^\s*\['\|'\],\?$\)//eg
  silent %s/', '/-/eg
  silent g/-/Tab /-
  silent g/-/>>
  silent %s/^),$\n^($/\r# 1\r/e
  silent %s/^($/# 1\r/e
  silent g/^)$/d
endfunction
