let g:tex_flavor = 'latex'

function VimSetAnOption(categ, lhs, rhs) abort
  if a:categ ==# 'bool'
    exe printf("set %s", (a:rhs == v:true) ? a:lhs : ('no' . a:lhs))
  elseif a:categ ==# 'grpx'
    exe printf("set guioptions %s=%s", a:rhs, a:lhs)
  else
    exe printf("set %s=%s", a:lhs, a:rhs)
  endif
endfunction

function VimSetOptions(options) abort
  for categ in keys(a:options)
    for [lhs, rhs] in items(a:options[categ])
      cal VimSetAnOption(categ, lhs, rhs)
    endfor
  endfor
endfunction

function VimSetAKeymap(mod, lhs, rhs) abort
  let l:noremap = {
        \  'normal': 'nnoremap',
        \  'insert': 'inoremap',
        \  'visual': 'vnoremap',
        \}
  exe printf("%s %s %s", l:noremap[a:mod], a:lhs, a:rhs)
endfunction

function VimSetKeymaps(keymaps) abort
  for X in a:keymaps
    cal VimSetAKeymap(X['mod'], X['lhs'], X['rhs'])
  endfor
endfunction

function VimSetTeXMaps() abort
  " s:keymaps {{{
  let l:keymaps = [
        \  {
        \    'mod': 'normal',
        \    'lhs': '<leader>mk',
        \    'rhs': ':make<cr>',
        \    'des': 'compile the draft version of the root document',
        \  },
        \  {
        \    'mod': 'normal',
        \    'lhs': '<leader>mb',
        \    'rhs': ':make bib<cr>',
        \    'des': 'compile the bibliography',
        \  },
        \  {
        \    'mod': 'normal',
        \    'lhs': '<leader>mc',
        \    'rhs': ':make clean<cr>',
        \    'des': 'clean auxiliary files',
        \  },
        \  {
        \    'mod': 'normal',
        \    'lhs': '<leader>mf',
        \    'rhs': ':make final<cr>',
        \    'des': 'compile the final version of the root document',
        \  },
        \  {
        \    'mod': 'normal',
        \    'lhs': '<leader>gb',
        \    'rhs': ':cal VimGetBibTeXCitationKeys()<cr>',
        \    'des': 'get bibtex citation keys',
        \  },
        \]
  " }}}
  cal VimSetKeymaps(l:keymaps)
endfunction

function VimAutoFormatTeXCodeOnEverySave() abort
  let l:pos = getpos('.')
  sil exe 'norm gg=G'
  cal setpos('.', l:pos)
  sil exe 'norm zz'
endfunction

function VimSetAnAutocmd(augroup, events, pattern, action) abort
  exe printf("augroup %s", a:augroup)
  autocmd!
  exe printf("autocmd %s %s %s", a:events, a:pattern, a:action)
  augroup END
endfunction

function VimSetAutocmds(autocmds) abort
  for X in a:autocmds
    cal VimSetAnAutocmd(X['augroup'], X['events'], X['pattern'], X['action'])
  endfor
endfunction

function VimGetCurrentMode(mode) abort
  " mode {{{
  let l:MODE = {
        \  'n': {
        \    'mod': 'NORMAL',
        \    'dscr': 'Normal'
        \  },
        \  'no': {
        \    'mod': 'O-PENDING',
        \    'dscr': 'Operator-pending'
        \  },
        \  'nov': {
        \    'mod': 'O-PENDING',
        \    'dscr': 'Operator-pending (forced characterwise |o_v|)'
        \  },
        \  'noV': {
        \    'mod': 'O-PENDING',
        \    'dscr': 'Operator-pending (forced linewise |o_V|)'
        \  },
        \  'noCTRL-V': {
        \    'mod': 'O-PENDING',
        \    'dscr': 'Operator-pending (forced blockwise |o_CTRL-V|)'
        \  },
        \  'niI': {
        \    'mod': 'NORMAL',
        \    'dscr': 'Normal using |i_CTRL-O| in |Insert-mode|'
        \  },
        \  'niR': {
        \    'mod': 'NORMAL',
        \    'dscr': 'Normal using |i_CTRL-O| in |Replace-mode|'
        \  },
        \  'niV': {
        \    'mod': 'NORMAL',
        \    'dscr': 'Normal using |i_CTRL-O| in |Virtual-Replace-mode|'
        \  },
        \  'nt': {
        \    'mod': 'TERMINAL',
        \    'dscr': 'Terminal-Normal (insert goes to Terminal-Job mode)'
        \  },
        \  'v': {
        \    'mod': 'VISUAL',
        \    'dscr': 'Visual by character'
        \  },
        \  'vs': {
        \    'mod': 'VISUAL',
        \    'dscr': 'Visual by character using |v_CTRL-O| in Select mode'
        \  },
        \  'V': {
        \    'mod': 'VISUAL',
        \    'dscr': 'Visual by line'
        \  },
        \  'Vs': {
        \    'mod': 'VISUAL',
        \    'dscr': 'Visual by line using |v_CTRL-O| in Select mode'
        \  },
        \  'CTRL-V': {
        \    'mod': 'VISUAL',
        \    'dscr': 'Visual blockwise'
        \  },
        \  'CTRL-Vs': {
        \    'mod': 'VISUAL',
        \    'dscr': 'Visual blockwise using |v_CTRL-O| in Select mode'
        \  },
        \  's': {
        \    'mod': 'SELECT',
        \    'dscr': 'Select by character'
        \  },
        \  'S': {
        \    'mod': 'SELECT',
        \    'dscr': 'Select by line'
        \  },
        \  'CTRL-S': {
        \    'mod': 'SELECT',
        \    'dscr': 'Select blockwise'
        \  },
        \  'i': {
        \    'mod': 'INSERT',
        \    'dscr': 'Insert'
        \  },
        \  'ic': {
        \    'mod': 'INSERT',
        \    'dscr': 'Insert mode completion |compl-generic|'
        \  },
        \  'ix': {
        \    'mod': 'INSERT',
        \    'dscr': 'Insert mode |i_CTRL-X| completion'
        \  },
        \  'R': {
        \    'mod': 'REPLACE',
        \    'dscr': 'Replace |R|'
        \  },
        \  'Rc': {
        \    'mod': 'REPLACE',
        \    'dscr': 'Replace mode completion |compl-generic|'
        \  },
        \  'Rx': {
        \    'mod': 'REPLACE',
        \    'dscr': 'Replace mode |i_CTRL-X| completion'
        \  },
        \  'Rv': {
        \    'mod': 'VIRTUAL',
        \    'dscr': 'Virtual Replace |gR|'
        \  },
        \  'Rvc': {
        \    'mod': 'VIRTUAL',
        \    'dscr': 'Virtual Replace mode completion |compl-generic|'
        \  },
        \  'Rvx': {
        \    'mod': 'VIRTUAL',
        \    'dscr': 'Virtual Replace mode |i_CTRL-X| completion'
        \  },
        \  'c': {
        \    'mod': 'COMMAND',
        \    'dscr': 'Command-line editing'
        \  },
        \  'cv': {
        \    'mod': 'EX',
        \    'dscr': 'Vim Ex mode |gQ|'
        \  },
        \  'ce': {
        \    'mod': 'NORMAL',
        \    'dscr': 'Normal Ex mode |Q|'
        \  },
        \  'r': {
        \    'mod': 'PROMPT',
        \    'dscr': 'Hit-enter prompt'
        \  },
        \  'rm': {
        \    'mod': 'PROMPT',
        \    'dscr': 'The -- more -- prompt'
        \  },
        \  'r?': {
        \    'mod': 'CONFIRM',
        \    'dscr': 'A |:confirm| query of some sort'
        \  },
        \  '!': {
        \    'mod': 'SHELL',
        \    'dscr': 'Shell or external command is executing'
        \  },
        \  't': {
        \    'mod': 'TERMINAL',
        \    'dscr': 'Terminal-Job mode: keys go to the job'
        \  },
        \}
  " }}}
  if has_key(l:MODE, a:mode)
    return l:MODE[a:mode]['mod']
  else
    return 'UNKNOWN'
  endif
endfunction

function VimEchoGitBranch() abort
  let l:branch = system('git branch --show-current 2>/dev/null')
  if strlen(l:branch) > 0
    echo l:branch
  else
    echo 'none'
  endif
endfunction

function VimSetStatusline() abort
  let l:bufnr = '[%n]'
  let l:mode = '%{VimGetCurrentMode(mode())}'
  let l:tail_of_filename = '%t'
  let l:modified_flag = '%m'
  let l:lhs_rhs_separator = '%='
  let l:fileencoding = '%{&fileencoding}'
  let l:fileformat = '%{&fileformat}'
  let l:file_type = '%Y'
  let l:percentage_through_file = '%P'
  let l:line_and_column_numbers = '(%06l:%06c)'
  let l:statusline = printf(
        \  "%s %s %s %s %s %s %s %s %s %s",
        \  l:bufnr,
        \  l:mode,
        \  l:tail_of_filename,
        \  l:modified_flag,
        \  l:lhs_rhs_separator,
        \  l:fileencoding,
        \  l:fileformat,
        \  l:file_type,
        \  l:percentage_through_file,
        \  l:line_and_column_numbers,
        \)
  return l:statusline
endfunction

function VimSetColorscheme() abort
  let l:colorscheme = [
        \  'habamax',
        \  'lunaperche',
        \  'slate',
        \]
  let l:choice = rand(srand()) % len(l:colorscheme)
  exe printf("colorscheme %s", l:colorscheme[l:choice])
endfunction

function VimRemoveNonASCIICharsFromCurrentBuffer() abort
  let l:pos = getpos('.')
  let l:reg = getreg('/')
  for [lhs, rhs] in items(TableOfEquivalentNonAsciiCharacters())
    sil exe printf("1,$s/%s/%s/ge", lhs, rhs)
  endfor
  cal setpos('.', l:pos)
  cal setreg('/', l:reg)
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
  cal writefile([l:abbrv], expand('~/.vim/spell/words.abbr'), 'a')
  echo printf("%s %s %s", 'Added', l:abbrv, 'to ~/.vim/spell/words.abbr')
endfunction

function VimAddCurrentWordToTheWordsList() abort
  let l:cword = expand('<cword>')
  cal writefile([l:cword], expand('~/.vim/spell/words.dict'), 'a')
  echo printf("%s %s %s", 'Added', l:cword, 'to ~/.vim/spell/words.dict')
endfunction

function VimRemoveTrailingSpacesFromCurrentBuffer() abort
  let l:pos = getpos('.')
  let l:reg = getreg('/')
  sil 1,$s/\s\+$//e
  cal setpos('.', l:pos)
  cal setreg('/', l:reg)
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
  sil exe printf("DB sqlite:%s select key, year, title from ref", l:db)
endfunction

function VimQueryBibTeXDatabase(query) abort
  " This function depends on TPope's vim-dadbod
  let l:db = expand('~/.local/share/references/zotero.db')
  sil exe printf("DB sqlite:%s select * from ref where %s", l:db, a:query)
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
      sil exe printf("g/%s/s/%s/%s/", l:key_target, l:key_before, l:key_after)
      sil exe printf("g/\\(%s\\) \\+=/d", join(l:re['unwanted_fields'], '\|'))
      let @q = '/^@j:Tab /='
      sil exe 'norm 120@q'
endfunction

function VimCreateCSVFileWithDisciplines() abort
  sil exe 'norm ggVGu'
  cal VimRemoveNonASCIICharsFromCurrentBuffer()
  sil 1,$s/ \+/ /g
  sil 1,$s/\<\([a-z]\+\)\> \<\([2-6]\{1,3\}[mtn][1-6]\{1,3\}\)\>/\1 - \2/ge
  sil 1,$s/[2-6]\{1,3\}[mtn][1-6]\{1,3\}/&\r/g
  sil 1,$s/\(^\s\+\|\s\+$\)//ge
  sil exe 'g/^$/d'
  sil exe 'g/^\(disciplinas de externas\|manha\|tarde\|noite\)/d'
  let l:macro = [
        \  '/^campus aparecida',
        \  'ma/^campus colemar',
        \  'mb/^campus samambaia',
        \  'mc`addV`bk:s/^/campus aparecida - /',
        \  '`bddV`ck:s/^/campus colemar - /',
        \  '`cddVG:s/^/campus samambaia - /'
        \]
  let @q = join(l:macro, '')
  sil exe 'norm @q'
  sil 1,$s/-/;/g
  sil exe 'Tab /;'
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
  sil exe 'norm ggVGu'
  cal VimRemoveNonASCIICharsFromCurrentBuffer()
  sil exe printf("1,$s/%s/%s/g", l:re['lhs'][0], l:re['rhs'][0])
  sil g!/\v(\(perfil\)$|(curso|matricula|usuario|e-mail):)/d
  sil 1,$s/\s\+$//e
  sil exe printf("1,$s/%s/%s/", l:re['lhs'][1], l:re['rhs'][1])
  sil exe printf("1,$s/%s/%s/", l:re['lhs'][2], l:re['rhs'][2])
  sil exe printf("1,$s/%s/%s/", l:re['lhs'][3], l:re['rhs'][3])
  sil exe printf("1,$s/%s/%s/", l:re['lhs'][4], l:re['rhs'][4])
  sil exe printf("1,$s/%s/%s/", l:re['lhs'][5], l:re['rhs'][5])
  sil exe printf("1,$s/%s/%s/", l:re['lhs'][6], l:re['rhs'][6])
  sil g/"email"/s/$/\r"grade": {"E1": 0, "E2": 0, "E3": 0},/
  sil exe 'norm ggc/^"\d\{9}student = {Go}gg=G'
  sil exe 'g/^\s*$/d'
endfunction

function VimEditLogbook(code) abort
  let l:date = system("date +'%Y-%m-%d'")
  let l:file = "~/templates/python/classes/pkgs/discipline/%s/logbook.py"
  sil exe printf(":e +/%s %s", l:date, expand(printf(l:file, a:code)))
endfunction

function VimCreateCatalogueForMe() abort
  sil exe 'norm ggd/<tbody>'
  sil exe 'norm Gd?<\/tbody>'
  sil 1,$s/\(<sup><u>o<\/u><\/sup> *\|<\/\?\(p\|strong\|tbody\)>\|\[AR\]\)//ge
  sil 1,$s/<\(t[dhr]\)[^>]\+>/<\1>/g
  sil 1,$s/<a[^>]\+>\([^<]\+\)\(<br \/>\)\?<\/a>/\1/g
  sil 1,$s/\([0-9]\{2\}CBM\|MON\|NMAT\|PM\)-\([0-9]\{2\}\)/\1\2/g
  let @q = '/^<trV/^<\/tr>$J^ci<++'
  sil! exe 'norm 1000@q'
  sil 1,$s/\(^<++> <t[dhr]>\|<\/t[dhr]> <\/t[dhr]>$\)//g
  sil 1,$s/<\/t[dhr]> <t[dhr]>/;/g
  sil 1,$s/&#8217;/'/ge
  sil 1,$s/&#8211;/-/ge
  sil 1,$s/\(^ \+\| \+$\)//ge
  let l:re = {
        \  'lhs': '^\([^;]\+\);\([^;]\+\);\([^;]\+\);\(.*\)$',
        \  'rhs': [
        \    '{\r"collection": "\1",',
        \    '"title": "\2",',
        \    '"author": "\3",',
        \    '"year": "\4"\r}',
        \  ]
        \}
  sil exe printf("1,$s/%s/%s,/", l:re['lhs'], join(l:re['rhs'], '\r'))
  sil 1s/^/[/
  sil $s/,$/\r]/
  sil 1,$s/ \+",$/",/
endfunction

function VimParseEeesInfo() abort
  sil exe 'norm ggVGu'
  call VimRemoveNonASCIICharsFromCurrentBuffer()
  sil exe 'norm ggd/abiel costa macedo<\/span>'
  sil exe 'norm /wcedro@ufg.brjdG'
  sil 1,$s/<[^>]\+>//g
  sil 1,$s/telefone:(62) 3521-\d\{4}//
  sil 1,$s/\(sala\|formacao\|area de atuacao\|lattes\|pagina pessoal\|e-mail\):/\r\1:/g
  sil g/\(^\s*$\|pagina pessoal\)/d
  sil 1,$s@http://lattes.cnpq.br/@@
  sil 1,$s/sala: *\(\d\{3\}\)/"office": "\1",/
  sil 356s/sala: */"office": "121",/
  sil 475s/$/\r"office": "000",/
  sil 1,$s/formacao: *\(.*\) */"school": "\1",/
  sil 1,$s/area de atuacao: *\(.*\) */"field": "\1",/
  sil 1,$s/lattes: *\(\d\{16\}\) */"\1": {/
  sil 257s/lattes: lattes/"3206466156270217": {/
  sil 449s/lattes: lattes/"9663485072140551": {/
  sil 1,$s/e-mail: *\(.*\)/"email": "\1"/
  sil g/^[a-z]/s/\v(^|$)/"/g
  sil g!/:/s/^/"fname": /
  sil g/fname/s/$/,/
  let @q = '/"\d\{16\}": {\n"email": ;.m-55jo},€ýa'
  sil exe 'norm 100@q'
  sil 1s/^/{\r/
  sil $s/,$/\r}/
  sil exe 'norm gg=G'
endfunction

" vim: set fileencoding=utf-8:
