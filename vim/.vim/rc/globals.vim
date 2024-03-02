let g:tex_flavor = 'latex'

" table of equivalent chars {{{
let s:table_of_equivalent_characters = {
      \  'à': 'a',
      \  'á': 'a',
      \  'â': 'a',
      \  'ã': 'a',
      \  'é': 'e',
      \  'ê': 'e',
      \  'í': 'i',
      \  'ó': 'o',
      \  'ô': 'o',
      \  'õ': 'o',
      \  'ú': 'u',
      \  'ç': 'c',
      \}
" }}}

" table of equivalent chars for non ascii {{{
let s:table_of_equivalent_non_ascii_chars = {
      \  '–': '-',
      \}
" }}}

function VimSetAnOption(categ, lhs, rhs) abort
  if a:categ ==# 'bool'
    execute printf("set %s", (a:rhs == v:true) ? a:lhs : ('no' . a:lhs))
  elseif a:categ ==# 'grpx'
    execute printf("set guioptions %s=%s", a:rhs, a:lhs)
  else
    execute printf("set %s=%s", a:lhs, a:rhs)
  endif
endfunction

function VimSetOptions(options) abort
  for categ in keys(a:options)
    for [lhs, rhs] in items(a:options[categ])
      call VimSetAnOption(categ, lhs, rhs)
    endfor
  endfor
endfunction

function VimSetAKeymap(mod, lhs, rhs) abort
  let l:noremap = {
        \  'normal': 'nnoremap',
        \  'insert': 'inoremap',
        \  'visual': 'vnoremap',
        \}
  execute printf("%s %s %s", l:noremap[a:mod], a:lhs, a:rhs)
endfunction

function VimSetKeymaps(keymaps) abort
  for keymap in a:keymaps
    call VimSetAKeymap(keymap['mod'], keymap['lhs'], keymap['rhs'])
  endfor
endfunction

function VimSetKeymapsForBuildingLaTeXDocumentsWithMake() abort
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
        \    'lhs': '<leader>bc',
        \    'rhs': ':call VimGetBibTeXCitationKeys()<cr>',
        \    'des': 'get bibtex citation keys',
        \  },
        \]
  " }}}
  call VimSetKeymaps(l:keymaps)
endfunction

function VimSetAnAutocmd(augroup, events, pattern, action) abort
  execut printf("augroup %s", a:augroup)
  autocmd!
  execute printf("autocmd %s %s %s", a:events, a:pattern, a:action)
  augroup END
endfunction

function VimSetAutocmds(autocmds) abort
  for X in a:autocmds
    call VimSetAnAutocmd(X['augroup'], X['events'], X['pattern'], X['action'])
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
  let l:filename_tail = '%t'
  let l:modified_flag = '%m'
  let l:lhs_rhs_separator = '%='
  let l:fileencoding = '%{&fileencoding}'
  let l:fileformat = '%{&fileformat}'
  let l:file_type = '%Y'
  let l:percentage_through_file = '%P'
  let l:line_and_column_numbers = '(%06l:%06c)'
  let l:statusline = join([
        \  l:bufnr,
        \  l:mode,
        \  l:filename_tail,
        \  l:modified_flag,
        \  l:lhs_rhs_separator,
        \  l:fileencoding,
        \  l:fileformat,
        \  l:file_type,
        \  l:percentage_through_file,
        \  l:line_and_column_numbers
        \])
  return l:statusline
endfunction

function VimSetColorscheme() abort
  let l:colorscheme = [
        \  'habamax',
        \  'lunaperche',
        \  'slate',
        \]
  let l:choice = rand(srand()) % len(l:colorscheme)
  execute printf("colorscheme %s", l:colorscheme[l:choice])
endfunction

function VimRemoveSpecialCharsFromCurrentBuffer() abort
  let l:pos = getpos('.')
  let l:reg = getreg('/')
  for [lhs, rhs] in items(s:table_of_equivalent_characters)
    silent execute printf("1,$s/%s/%s/ge", lhs, rhs)
  endfor
  for [lhs, rhs] in items(s:table_of_equivalent_non_ascii_chars)
    silent execute printf("1,$s/%s/%s/ge", lhs, rhs)
  endfor
  call setpos('.', l:pos)
  call setreg('/', l:reg)
endfunction

function VimRemoveSpecialCharsFromCurrentWord() abort
  let l:cword = expand('<cword>')
  let l:pword = expand('<cword>')
  for [lhs, rhs] in items(s:table_of_equivalent_characters)
    let l:pword = substitute(l:pword, lhs, rhs, 'gi')
  endfor
  return printf("%s %s %s", 'iabbrev' , l:pword , l:cword)
endfunction

function VimAddCurrentWordToMyListOfAbbreviations() abort
  let l:abbrv = VimRemoveSpecialCharsFromCurrentWord()
  call writefile([l:abbrv], expand('~/.vim/spell/words.abbr'), 'a')
  echo printf("%s %s %s", 'Added', l:abbrv, 'to ~/.vim/spell/words.abbr')
endfunction

function VimAddCurrentWordToMyListOfWords() abort
  let l:cword = expand('<cword>')
  call writefile([l:cword], expand('~/.vim/spell/words.dict'), 'a')
  echo printf("%s %s %s", 'Added', l:cword, 'to ~/.vim/spell/words.dict')
endfunction

function VimRemoveTrailingSpacesFromCurrentBuffer() abort
  let l:pos = getpos('.')
  let l:reg = getreg('/')
  1,$s/\s\+$//e
  call setpos('.', l:pos)
  call setreg('/', l:reg)
endfunction

function SubsCWordWithRegZeroWhileRetainingCursorPos() abort
  let l:pos = getpos('.')
  execute printf("1,$s/%s/%s/g", expand('<cword>'), getreg('0'))
  call setpos('.', l:pos)
endfunction

function VimInstallMissingPlugins() abort
  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    PlugInstall --sync
  endif
endfunction

function VimGetBibTeXCitationKeys() abort
  let l:bfile = expand('~/.local/share/references/zotero.bib')
  execute printf(":vimgrep /^@/j %s", l:bfile)
  copen
  wincmd k
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
      let @q = '/^@j:Tab /=/,$\n^}x'
      sil exe 'norm 120@q'
endfunction

function VimCreateCSVFileWithDisciplines() abort
  norm ggVGu
  call VimRemoveSpecialCharsFromCurrentBuffer()
  sil 1,$s/ \+/ /g
  sil 1,$s/\<\([a-z]\+\)\> \<\([2-6]\{1,3\}[mtn][1-6]\{1,3\}\)\>/\1 - \2/ge
  sil 1,$s/[2-6]\{1,3\}[mtn][1-6]\{1,3\}/&\r/g
  sil 1,$s/\(^\s\+\|\s\+$\)//ge
  sil g/^$/d
  sil g/^\(disciplinas de externas\|manha\|tarde\|noite\)/d
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
endfunction

function VimParseStudentsInfo() abort
  let l:re = {
        \  'lhs': [
        \    '\v(enviar mensagem|usuario (on|off)-line no sigaa)',
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
  norm ggVGu
  call VimRemoveSpecialCharsFromCurrentBuffer()
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
  sil norm ggc/^"\d\{9}student = {Go}gg=G
endfunction

function PracticeDayOnePrepareClasses() abort
  let l:head = [
        \  '\\begin{table}[H]',
        \  '\\centering',
        \  '\\begin{tabular}{ccccccccccc}\r',
        \]
  let l:tail = [
        \  '\r\\end{tabular}',
        \  '\\caption{Standard Normal Distribution function}',
        \  '\\label{tbl:standard-normal-distribution-function}',
        \  '\\end{table}'
        \]
  let l:payload_head = join(l:head, '\r')
  let l:payload_tail = join(l:tail, '\r')
  let l:substitute_cmd_head = printf("0s/^/%s/", l:payload_head)
  let l:substitute_cmd_tail = printf("$s/$/%s/", l:payload_tail)
  1,$s/\s\+/ /g
  g!/\.\d\{2,}/d
  1,$s/ \.0\(\d\)\>/ \& 0\.0\100/g
  1,$s/ \.\(\d\)\>/ 0\.\1/
  1,$s/ \.\(\d\{4}\)/ \& 0\.\1/g
  g/0\.\d\+/s/$/\\\\/
  Tab /\(&\|\\\\\)
  exe l:substitute_cmd_head
  exe l:substitute_cmd_tail
endfunction
