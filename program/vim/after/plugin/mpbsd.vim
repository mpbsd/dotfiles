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

function! mpbsd#sigaa_students_json() abort
  let l:fn = expand('%')
  if l:fn =~# '\<IME[0-9]\{4\}\.json\>' && search('^\s\+"[0-9]\{9\}": {$') == 0
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
