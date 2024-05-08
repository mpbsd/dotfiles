let g:tex_flavor = 'latex'

function VimRemoveNonASCIICharsFromCurrentBuffer() abort
  let l:pos = getpos('.')
  let l:reg = getreg('/')
  for [lhs, rhs] in items(TableOfEquivalentNonAsciiCharacters())
    silent execute printf("1,$s/%s/%s/ge", lhs, rhs)
  endfor
  call setpos('.', l:pos)
  call setreg('/', l:reg)
endfunction

function VimRemoveNonASCIICharsFromCurrentWord(cword) abort
  let l:pword = a:cword
  for [lhs, rhs] in items(TableOfEquivalentNonAsciiCharacters())
    let l:pword = substitute(l:pword, lhs, rhs, 'gie')
  endfor
  return printf("%s %s %s", 'iabbrev' , l:pword , a:cword)
endfunction

function VimAddCurrentWordToTheAbbreviationsList() abort
  let l:abbrv = VimRemoveNonASCIICharsFromCurrentWord(expand('<cword>'))
  call writefile([l:abbrv], expand('~/.vim/spell/words.abbr'), 'a')
  echo printf("%s %s %s", 'Added', l:abbrv, 'to ~/.vim/spell/words.abbr')
endfunction

function VimAddCurrentWordToTheWordsList() abort
  let l:cword = expand('<cword>')
  call writefile([l:cword], expand('~/.vim/spell/words.dict'), 'a')
  echo printf("%s %s %s", 'Added', l:cword, 'to ~/.vim/spell/words.dict')
endfunction

function VimRemoveTrailingSpacesFromCurrentBuffer() abort
  let l:pos = getpos('.')
  let l:reg = getreg('/')
  silent 1,$s/\s\+$//e
  call setpos('.', l:pos)
  call setreg('/', l:reg)
endfunction

function VimInstallMissingPlugins() abort
  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    PlugInstall --sync
    wincmd q
  endif
endfunction

function VimGetBibTeXCitationKeys() abort
  " This function depends on TPope's vim-dadbod
  let l:db = expand('~/.local/share/references/zotero.db')
  silent execute printf("DB sqlite:%s select key, year, title from ref", l:db)
endfunction

function VimQueryBibTeXDatabase(query) abort
  " This function depends on TPope's vim-dadbod
  let l:db = expand('~/.local/share/references/zotero.db')
  silent execute printf("DB sqlite:%s select * from ref where %s", l:db, a:query)
endfunction

function VimFormatMyBibTeXFile() abort
  let l:re = {
        \  'key': {
        \    'tgt': '^@.*[0-9]\{4},$',
        \    'lhs': '{\([a-z]\+\)\(\([A-Z][a-z]\+\)\+\)\([0-9]\{4}\),$',
        \    'rhs': '{\1\4\2,'
        \  },
        \  'unwanted_fields': [
        \    'abstract',
        \    'address',
        \    'annotation',
        \    'archiveprefix',
        \    'copyright',
        \    'edition',
        \    'eprint',
        \    'eprinttype',
        \    'file',
        \    'keywords',
        \    'langid',
        \    'lccn',
        \    'month',
        \    'number',
        \    'pages',
        \    'primaryclass',
        \    'shorttitle',
        \    'urldate',
        \    'volume',
        \  ],
        \}
      let l:key_target = l:re['key']['tgt']
      let l:key_before = l:re['key']['lhs']
      let l:key_after  = l:re['key']['rhs']
      silent execute printf("g/%s/s/%s/%s/", l:key_target, l:key_before, l:key_after)
      silent execute printf("g/\\(%s\\) \\+=/d", join(l:re['unwanted_fields'], '\|'))
      let @q = '/^@j:Tab /='
      silent execute 'norm 120@q'
endfunction

function VimCreateCSVFileWithDisciplines() abort
  silent execute 'norm ggVGu'
  call VimRemoveNonASCIICharsFromCurrentBuffer()
  silent 1,$s/ \+/ /g
  silent 1,$s/\<\([a-z]\+\)\> \<\([2-6]\{1,3\}[mtn][1-6]\{1,3\}\)\>/\1 - \2/ge
  silent 1,$s/[2-6]\{1,3\}[mtn][1-6]\{1,3\}/&\r/g
  silent 1,$s/\(^\s\+\|\s\+$\)//ge
  silent execute 'g/^$/d'
  silent execute 'g/^\(disciplinas de externas\|manha\|tarde\|noite\)/d'
  let l:macro = [
        \  '/^campus aparecida',
        \  'ma/^campus colemar',
        \  'mb/^campus samambaia',
        \  'mc`addV`bk:s/^/campus aparecida - /',
        \  '`bddV`ck:s/^/campus colemar - /',
        \  '`cddVG:s/^/campus samambaia - /'
        \]
  let @q = join(l:macro, '')
  silent execute 'norm @q'
  silent 1,$s/-/;/g
  silent execute 'Tab /;'
endfunction

function VimParseStudentsInfo() abort
  let l:st = [
        \  'visualizar parecer sobre necessidade educacional especial do aluno',
        \  'enviar mensagem',
        \  'usuario (on|off)-line no sigaa',
        \]
  let l:re = {
        \  'lhs': [
        \    printf("\\v(%s|%s|%s)", l:st[0], l:st[1], l:st[2]),
        \    '\v^ ([a-z ]+) \(perfil\)$',
        \    '\v^curso: ([a-z ]+)$',
        \    '\v^matricula: ([0-9]{9})$',
        \    '\v^usuario: ([a-z0-9_.]+)$',
        \    '\v^e-mail: ([a-z0-9_.@]+)$',
        \    '\v"fname": "([^"]+)",\n"gradc": "([^"]+)",\n"(\d{9})"',
        \  ],
        \  'rhs': [
        \    '\r',
        \    '"fname": "\1",',
        \    '"gradc": "\1",',
        \    '"\1"',
        \    '"uname": "\1",',
        \    '"email": "\1",\r},',
        \    '"\3": {\r"fname": "\1",\r"gradc": "\2",',
        \  ],
        \}
  silent execute 'norm ggVGu'
  call VimRemoveNonASCIICharsFromCurrentBuffer()
  silent execute printf("1,$s/%s/%s/g", l:re['lhs'][0], l:re['rhs'][0])
  silent g!/\v(\(perfil\)$|(curso|matricula|usuario|e-mail):)/d
  silent 1,$s/\s\+$//e
  silent execute printf("1,$s/%s/%s/", l:re['lhs'][1], l:re['rhs'][1])
  silent execute printf("1,$s/%s/%s/", l:re['lhs'][2], l:re['rhs'][2])
  silent execute printf("1,$s/%s/%s/", l:re['lhs'][3], l:re['rhs'][3])
  silent execute printf("1,$s/%s/%s/", l:re['lhs'][4], l:re['rhs'][4])
  silent execute printf("1,$s/%s/%s/", l:re['lhs'][5], l:re['rhs'][5])
  silent execute printf("1,$s/%s/%s/", l:re['lhs'][6], l:re['rhs'][6])
  silent g/"email"/s/$/\r"grade": {"E1": 0, "E2": 0, "E3": 0},/
  silent execute 'norm ggc/^"\d\{9}student = {Go}gg=G'
  silent execute 'g/^\s*$/d'
endfunction

function VimEditLogbook(code) abort
  let l:date = system("date +'%Y-%m-%d'")
  let l:file = "~/templates/python/classes/pkgs/discipline/%s/logbook.py"
  silent execute printf(":e +/%s %s", l:date, expand(printf(l:file, a:code)))
endfunction

function VimCreateCatalogueForMe() abort
  silent execute 'norm ggd/<tbody>'
  silent execute 'norm Gd?<\/tbody>'
  silent 1,$s/\(<sup><u>o<\/u><\/sup> *\|<\/\?\(p\|strong\|tbody\)>\|\[AR\]\)//ge
  silent 1,$s/<\(t[dhr]\)[^>]\+>/<\1>/g
  silent 1,$s/<a[^>]\+>\([^<]\+\)\(<br \/>\)\?<\/a>/\1/g
  silent 1,$s/\([0-9]\{2\}CBM\|MON\|NMAT\|PM\)-\([0-9]\{2\}\)/\1\2/g
  let @q = '/^<trV/^<\/tr>$J^ci<++'
  silent! execute 'norm 1000@q'
  silent 1,$s/\(^<++> <t[dhr]>\|<\/t[dhr]> <\/t[dhr]>$\)//g
  silent 1,$s/<\/t[dhr]> <t[dhr]>/;/g
  silent 1,$s/&#8217;/'/ge
  silent 1,$s/&#8211;/-/ge
  silent 1,$s/\(^ \+\| \+$\)//ge
  let l:re = {
        \  'lhs': '^\([^;]\+\);\([^;]\+\);\([^;]\+\);\(.*\)$',
        \  'rhs': [
        \    '{\r"collection": "\1",',
        \    '"title": "\2",',
        \    '"author": "\3",',
        \    '"year": "\4"\r}',
        \  ]
        \}
  silent execute printf("1,$s/%s/%s,/", l:re['lhs'], join(l:re['rhs'], '\r'))
  silent 1s/^/[/
  silent $s/,$/\r]/
  silent 1,$s/ \+",$/",/
endfunction

function VimParseEeesInfo() abort
  silent execute 'norm ggVGu'
  call VimRemoveNonASCIICharsFromCurrentBuffer()
  silent execute 'norm ggd/abiel costa macedo<\/span>'
  silent execute 'norm /wcedro@ufg.brjdG'
  silent 1,$s/<[^>]\+>//g
  silent 1,$s/telefone:(62) 3521-\d\{4}//
  silent 1,$s/\(sala\|formacao\|area de atuacao\|lattes\|pagina pessoal\|e-mail\):/\r\1:/g
  silent g/\(^\s*$\|pagina pessoal\)/d
  silent 1,$s@http://lattes.cnpq.br/@@
  silent 1,$s/sala: *\(\d\{3\}\)/"office": "\1",/
  silent 356s/sala: */"office": "121",/
  silent 475s/$/\r"office": "000",/
  silent 1,$s/formacao: *\(.*\) */"school": "\1",/
  silent 1,$s/area de atuacao: *\(.*\) */"field": "\1",/
  silent 1,$s/lattes: *\(\d\{16\}\) */"\1": {/
  silent 257s/lattes: lattes/"3206466156270217": {/
  silent 449s/lattes: lattes/"9663485072140551": {/
  silent 1,$s/e-mail: *\(.*\)/"email": "\1"/
  silent g/^[a-z]/s/\v(^|$)/"/g
  silent g!/:/s/^/"fname": /
  silent g/fname/s/$/,/
  silent %s/\(^"fname": .*\)\n\("office": .*\)\n\("school": .*\)\n\("field": .*\)\n\("\d\{16\}": {\)\n\("email": .*\)/\5\r\1\r\2\r\3\r\4\r\6\r},/
  silent 1s/^/{\r/
  silent $s/,$/\r}/
  silent execute 'norm gg=G'
endfunction

" vim: set fileencoding=utf8: "
