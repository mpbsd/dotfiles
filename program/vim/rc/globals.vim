let g:mapleader = ' '
let g:maplocalleader = ','
let g:netrw_banner = 0
let g:netrw_list_hide = '^\..*'
let g:tex_flavor = 'latex'
let g:UltiSnipsSnippetDirectories = [expand('~/.vim/ultisnips')]
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
let g:UltiSnipsEditSplit = 'tabdo'

function globals#vim_choose_a_colorscheme_for_me(variant) abort
  " options {{{
  let l:options = {
        \  'dark': [
        \    'desert',
        \    'habamax',
        \    'lunaperche',
        \    'pablo',
        \    'quiet',
        \    'slate',
        \  ],
        \  'light': [
        \    'shine',
        \    'zellner',
        \  ],
        \}
  " }}}
  if has_key(l:options, a:variant)
    let l:choice = rand(srand()) % len(l:options[a:variant])
    execute printf("set background=%s", a:variant)
    execute printf("colorscheme %s", l:options[a:variant][l:choice])
  else
    set background=dark
    colorscheme habamax
  endif
endfunction

function globals#vim_display_current_mode(mode) abort
  " MODE {{{1
  let l:MODE = {
        \  'n'    : 'NORMAL',
        \  'no'   : 'O-PENDING',
        \  'nov'  : 'O-PENDING',
        \  'noV'  : 'O-PENDING',
        \  'no' : 'O-PENDING',
        \  'niI'  : 'NORMAL',
        \  'niR'  : 'NORMAL',
        \  'niV'  : 'NORMAL',
        \  'nt'   : 'NORMAL',
        \  'v'    : 'VISUAL',
        \  'vs'   : 'VISUAL',
        \  'V'    : 'V-LINE',
        \  'Vs'   : 'V-LINE',
        \  ''   : 'V-BLOCK',
        \  's'  : 'V-BLOCK',
        \  's'    : 'SELECT',
        \  'S'    : 'S-LINE',
        \  ''   : 'S-BLOCK',
        \  'i'    : 'INSERT',
        \  'ic'   : 'INSERT',
        \  'ix'   : 'INSERT',
        \  'R'    : 'REPLACE',
        \  'Rc'   : 'REPLACE',
        \  'Rx'   : 'REPLACE',
        \  'Rv'   : 'V-REPLACE',
        \  'Rvc'  : 'V-REPLACE',
        \  'Rvx'  : 'V-REPLACE',
        \  'c'    : 'COMMAND',
        \  'cv'   : 'EX',
        \  'ce'   : 'EX',
        \  'r'    : 'PROMPT',
        \  'rm'   : 'MORE',
        \  'r?'   : 'CONFIRM',
        \  '!'    : 'SHELL',
        \  't'    : 'TERMINAL',
        \}
  " }}}
  if has_key(l:MODE, a:mode)
    return l:MODE[a:mode]
  endif
endfunction

function globals#vim_set_my_statusline() abort
  let l:components = [
        \  '[%n]',
        \  '%{globals#vim_display_current_mode(mode())}',
        \  '%t',
        \  '%m',
        \  '%=',
        \  '%{&fileencoding}',
        \  '%{&fileformat}',
        \  '%Y',
        \  '%P',
        \  '(%06l:%06c)'
        \]
  return join(l:components)
endfunction

function globals#vim_open_help_in_vertical_split() abort
  let l:search_for_help = input(':help ')
  execute printf(":vert help %s", l:search_for_help)
endfunction

function globals#vim_rm_trailing_spaces_from_cbuffer() abort
  let l:pos = getpos('.')
  let l:reg = getreg('/')
  silent %s/\s\+$//e
  call setpos('.', l:pos)
  call setreg('/', l:reg)
endfunction

function globals#vim_capitalize_all_occurrences_of_cword_in_cbuffer(cword) abort
  let l:pos = getpos('.')
  let l:reg = getreg('/')
  silent execute printf("1,$s/%s/\\U&/g", a:cword)
  call setpos('.', l:pos)
  call setreg('/', l:reg)
endfunction

function globals#table_of_ascii_equivalent_characters() abort
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
  return l:ascii_equivalent_chars
endfunction

function globals#vim_rm_non_ascii_chars_from_cbuffer() abort
  let l:pos = getpos('.')
  let l:reg = getreg('/')
  for [lhs, rhs] in items(globals#table_of_ascii_equivalent_characters())
    silent execute printf("1,$s/%s/%s/ge", lhs, rhs)
  endfor
  call setpos('.', l:pos)
  call setreg('/', l:reg)
endfunction

function globals#vim_get_BibTeX_citation_keys() abort
  " This function depends on TPope's vim-dadbod
  let l:db = expand('~/.local/share/references/zotero.db')
  silent execute printf("DB sqlite:%s select key, year, title from ref", l:db)
endfunction

function globals#vim_query_BibTeX_database(query) abort
  " This function depends on TPope's vim-dadbod
  let l:db = expand('~/.local/share/references/zotero.db')
  silent execute printf("DB sqlite:%s select * from ref where %s", l:db, a:query)
endfunction

function globals#vim_format_my_BibTeX_file() abort
  let l:re = {
        \  'key': {
        \    'tgt': '^@.*[0-9]\{4\},$',
        \    'lhs': '{\([a-z]\+\)\(\([A-Z][a-z]\+\)\+\)\([0-9]\{4\}\),$',
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

function globals#vim_create_csv_file_with_disciplines() abort
  silent execute 'norm ggguG'
  call globals#vim_rm_non_ascii_chars_from_cbuffer()
  silent %s/ \+/ /g
  silent %s/\<\([a-z]\+\)\> \<\([2-6]\{1,3\}[mtn][1-6]\{1,3\}\)\>/\1 - \2/ge
  silent %s/[2-6]\{1,3\}[mtn][1-6]\{1,3\}/&\r/g
  silent %s/\(^\s\+\|\s\+$\)//ge
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
  silent %s/-/;/g
  silent execute 'Tab /;'
endfunction

function globals#vim_parse_students_info() abort
  silent execute 'norm ggguG'
  call globals#vim_rm_non_ascii_chars_from_cbuffer()
  silent 1,$s/^\s\+//e
  silent 1,$s/\(^\)\@\<!\[usuario \(off\|on\)-line no sigaa\]/\r&/ge
  silent 1,$s/\s*enviar mensagem\s*//e
  v/\((perfil)$\|^\(curso\|matricula\|usuario\|e-mail\):\)/d
  g/^\(usuario: bezerra\|e-mail: bezerra@ufg.br\)$/d
  let l:re = [
        \ '^\[usuario \%(off\|on\)-line no sigaa\] \(.*\) (perfil)$',
        \ '^curso: \(.*\)$',
        \ '^matricula: \(.*\)$',
        \ '^usuario: \(.*\)$',
        \ '^e-mail: \(.*\)$',
        \]
  let l:su = '"\3": {"F": "\1", "G": "\2", "U": "\4", "E": "\5"},'
  silent execute printf("1,$s@%s@%s@e", join(l:re, '\n'), l:su)
endfunction

function globals#vim_edit_logbook(code) abort
  let l:date = system("date +'%Y-%m-%d'")
  let l:file = "~/templates/python/classes/pkgs/discipline/%s/logbook.py"
  silent execute printf(":e +/%s %s", l:date, expand(printf(l:file, a:code)))
endfunction

function globals#vim_create_catalog() abort
  execute 'norm ggd/<tbody>'
  execute 'norm /<\/tbody>jdG'
endfunction

function globals#vim_format_cpfnrs_for_me(opt) abort
  let l:pattern = '\<\(\d\{3}\)\.\?\(\d\{3}\)\.\?\(\d\{3}\)-\?\(\d\{2}\)\>'
  if a:opt ==# 'add_punct'
    let l:substitution = '\1.\2.\3-\4'
  elseif a:opt ==# 'rm_punct'
    let l:substitution = '\1\2\3\4'
  endif
  silent execute printf("1,$s/%s/%s/g", l:pattern, l:substitution)
endfunction

function globals#vim_format_dates_for_me() abort
  let l:d = '\(0[1-9]\|[12][0-9]\|3[01]\)'
  let l:m = '\(0[1-9]\|1[012]\)'
  let l:y = '\([0-9]\{4\}\)'
  let l:p = l:d . '[/-]' . l:m . '[/-]' . l:y
  let l:s = '\3\2\1'
  silent execute printf("1,$s@%s@%s@ge", l:p, l:s)
endfunction
