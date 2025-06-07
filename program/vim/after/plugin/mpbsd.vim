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

function! mpbsd#unicode_seq_to_char() abort
  silent %s/\\u\(\x\{4\}\)/\=nr2char('0x'.submatch(1),1)/ge
endfunction

function! mpbsd#sigaa_students_json() abort
  let l:fn = expand('%')
  let l:r1 = '\<IME[0-9]\{4\}\.json\>'
  let l:r2 = 'usu.rio \(on\|off\)-line no sigaa'
  let l:r3 = '^\s\+"[0-9]\{9\}": {$'
  if l:fn =~# l:r1 && search(l:r2) != 0 && search(l:r3) == 0
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
  endif
endfunction

function! mpbsd#regulares() abort
  argdo silent execute 'normal ggguG'
  argdo silent call mpbsd#unicode_seq_to_char()
  argdo silent call mpbsd#replace_non_ascii_chars()
  argdo silent %s/{"/{\r"/g
  argdo silent %s/,"/,\r"/g
  argdo silent %s/":\%( \)\@!/": /e
  argdo silent %s/telefone da escolaformato/telefone da escola/e
  argdo silent %s/"nome completo\%(\.[0-9]\{1,2\}\)\?"/"fname"/e
  argdo silent %s/"e-mail de contato individual\%(\.[0-9]\{1,2\}\)\?"/"email"/e
  argdo silent %s/"cpf\%(digite no padrao 000\.000\.000-00\)\?\%(\.[0-9]\{1,2\}\)\?"/"cpfnr"/e
  argdo silent %s/"data de nascimento\%(\.[0-9]\{1,2\}\)\?"/"birth"/e
  argdo silent %s/null},$/null\r},/
  argdo silent %s/"\%(voce \)\?deseja inscrever \%(algum\|outro\)(a) aluno(a) no nivel \([123]\)?\%(\.[0-9]\{1,2\}\)\?": "sim"/"level": \1/
  argdo silent %s/"\%(voce \)\?deseja inscrever \%(algum\|outro\)(a) aluno(a) no nivel \([123]\)?\%(\.[0-9]\{1,2\}\)\?": \%(null\|"nao"\)/"level": null/
  argdo silent %s/"caso o(a) aluno(a) tenha alguma necessidade especial para realizacao da prova, esta deve ser informada abaixo:\s*\%(\.[0-9]\{1,2\}\)\?"/"needs"/
  argdo silent g/"level":/s/^/{\r/
  argdo silent g/"needs":/s/$/\r},/
  argdo silent %s/,\%($\n^}\)\@=//
  argdo silent %s/}}$/\r}\r}/
  argdo silent %s/{$\n^"level": null,$\n^"fname": null,$\n^"email": null,$\n^"cpfnr": null,$\n^"birth": null,$\n^"needs": null$\n^},\?//
  argdo silent g/^$/d
  argdo silent g/"numero de telefone da escola"/s/$/\r"estudante": {/
  argdo silent g/"[0-9]\{1,2\}": {$/s/^/},\r/
  argdo silent %s/^{$\n^},$/{/
  argdo silent $s/$/\r}/
  argdo silent %s/,\%($\n^}\)\@=//
  argdo silent execute 'normal gg=G'
  argdo silent %s/\s\+\(",\?\)$/\1/
  let @q = '/^\s*{$\n^\s*"level":f{mm/"cpfnr":f:w"ayt,`mia: '
  argdo silent execute 'normal 1024@q'
endfunction
