function VimKeymapSet(keymaps) abort
  let l:noremap = {
        \  'normal': 'nnoremap',
        \  'insert': 'inoremap',
        \  'visual': 'vnoremap',
        \}
  for keymap in a:keymaps
    let l:mod = keymap['mod']
    let l:lhs = keymap['lhs']
    let l:rhs = keymap['rhs']
    execute printf("%s %s %s", l:noremap[l:mod], l:lhs, l:rhs)
  endfor
endfunction

function ShowVimMode() abort
  " mode {{{
  let l:vim_mode = {
        \  'n': {
        \    'mode': 'NORMAL',
        \    'desc': 'Normal'
        \  },
        \  'no': {
        \    'mode': 'O-PENDING',
        \    'desc': 'Operator-pending'
        \  },
        \  'nov': {
        \    'mode': 'O-PENDING',
        \    'desc': 'Operator-pending (forced characterwise |o_v|)'
        \  },
        \  'noV': {
        \    'mode': 'O-PENDING',
        \    'desc': 'Operator-pending (forced linewise |o_V|)'
        \  },
        \  'noCTRL-V': {
        \    'mode': 'O-PENDING',
        \    'desc': 'Operator-pending (forced blockwise |o_CTRL-V|)'
        \  },
        \  'niI': {
        \    'mode': 'NORMAL',
        \    'desc': 'Normal using |i_CTRL-O| in |Insert-mode|'
        \  },
        \  'niR': {
        \    'mode': 'NORMAL',
        \    'desc': 'Normal using |i_CTRL-O| in |Replace-mode|'
        \  },
        \  'niV': {
        \    'mode': 'NORMAL',
        \    'desc': 'Normal using |i_CTRL-O| in |Virtual-Replace-mode|'
        \  },
        \  'nt': {
        \    'mode': 'TERMINAL',
        \    'desc': 'Terminal-Normal (insert goes to Terminal-Job mode)'
        \  },
        \  'v': {
        \    'mode': 'VISUAL',
        \    'desc': 'Visual by character'
        \  },
        \  'vs': {
        \    'mode': 'VISUAL',
        \    'desc': 'Visual by character using |v_CTRL-O| in Select mode'
        \  },
        \  'V': {
        \    'mode': 'VISUAL',
        \    'desc': 'Visual by line'
        \  },
        \  'Vs': {
        \    'mode': 'VISUAL',
        \    'desc': 'Visual by line using |v_CTRL-O| in Select mode'
        \  },
        \  'CTRL-V': {
        \    'mode': 'VISUAL',
        \    'desc': 'Visual blockwise'
        \  },
        \  'CTRL-Vs': {
        \    'mode': 'VISUAL',
        \    'desc': 'Visual blockwise using |v_CTRL-O| in Select mode'
        \  },
        \  's': {
        \    'mode': 'SELECT',
        \    'desc': 'Select by character'
        \  },
        \  'S': {
        \    'mode': 'SELECT',
        \    'desc': 'Select by line'
        \  },
        \  'CTRL-S': {
        \    'mode': 'SELECT',
        \    'desc': 'Select blockwise'
        \  },
        \  'i': {
        \    'mode': 'INSERT',
        \    'desc': 'Insert'
        \  },
        \  'ic': {
        \    'mode': 'INSERT',
        \    'desc': 'Insert mode completion |compl-generic|'
        \  },
        \  'ix': {
        \    'mode': 'INSERT',
        \    'desc': 'Insert mode |i_CTRL-X| completion'
        \  },
        \  'R': {
        \    'mode': 'REPLACE',
        \    'desc': 'Replace |R|'
        \  },
        \  'Rc': {
        \    'mode': 'REPLACE',
        \    'desc': 'Replace mode completion |compl-generic|'
        \  },
        \  'Rx': {
        \    'mode': 'REPLACE',
        \    'desc': 'Replace mode |i_CTRL-X| completion'
        \  },
        \  'Rv': {
        \    'mode': 'REPLACE',
        \    'desc': 'Virtual Replace |gR|'
        \  },
        \  'Rvc': {
        \    'mode': 'REPLACE',
        \    'desc': 'Virtual Replace mode completion |compl-generic|'
        \  },
        \  'Rvx': {
        \    'mode': 'REPLACE',
        \    'desc': 'Virtual Replace mode |i_CTRL-X| completion'
        \  },
        \  'c': {
        \    'mode': 'COMMAND',
        \    'desc': 'Command-line editing'
        \  },
        \  'cv': {
        \    'mode': 'EX',
        \    'desc': 'Vim Ex mode |gQ|'
        \  },
        \  'ce': {
        \    'mode': 'EX',
        \    'desc': 'Normal Ex mode |Q|'
        \  },
        \  'r': {
        \    'mode': 'PROMPT',
        \    'desc': 'Hit-enter prompt'
        \  },
        \  'rm': {
        \    'mode': 'PROMPT',
        \    'desc': 'The -- more -- prompt'
        \  },
        \  'r?': {
        \    'mode': 'CONFIRM',
        \    'desc': 'A |:confirm| query of some sort'
        \  },
        \  '!': {
        \    'mode': 'SHELL',
        \    'desc': 'Shell or external command is executing'
        \  },
        \  't': {
        \    'mode': 'TERMINAL',
        \    'desc': 'Terminal-Job mode: keys go to the job'
        \  },
        \}
  " }}}
  let l:mod = mode()
  if has_key(l:vim_mode, l:mod)
    return l:vim_mode[l:mod]['mode']
  endif
endfunction

function MyStatusLine() abort
  " options {{{
  let l:section = {
        \  'lhs': [
        \    {
        \      'cmd': '[%n]',
        \      'des': 'buffer number',
        \    },
        \    {
        \      'cmd': '%{ShowVimMode()}',
        \      'des': 'current mode',
        \    },
        \    {
        \      'cmd': '%t',
        \      'des': 'tail of the filename in the buffer',
        \    },
        \    {
        \      'cmd': '%m',
        \      'des': 'modified flag',
        \    },
        \  ],
        \  'mid': [
        \    {
        \      'cmd': '%=',
        \      'des': 'lhs/rhs separator',
        \    },
        \  ],
        \  'rhs': [
        \    {
        \      'cmd': '%{&fenc}',
        \      'des': 'file encoding',
        \    },
        \    {
        \      'cmd': '%{&ff}',
        \      'des': 'file format',
        \    },
        \    {
        \      'cmd': '%Y',
        \      'des': 'type of file in the buffer',
        \    },
        \    {
        \      'cmd': '%P',
        \      'des': 'percentage through file of displayed window',
        \    },
        \    {
        \      'cmd': '(%06l:%06c)',
        \      'des': 'line and column numbers',
        \    },
        \  ],
        \}
  " }}}
  let l:stl = []
  for sec in ['lhs', 'mid', 'rhs']
    for obj in section[sec]
      call add(l:stl, obj['cmd'])
    endfor
  endfor
  return join(l:stl)
endfunction

function HandlerForSpecialCharacters() abort
  let l:cword = expand('<cword>')
  let l:pword = expand('<cword>')
  let l:subst = {
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
  for [lhs, rhs] in items(l:subst)
    let l:pword = substitute(l:pword, lhs, rhs, 'gi')
  endfor
  return printf("%s %s %s", 'iabbrev' , l:pword , l:cword)
endfunction

function AddWordUnderCursorToMyAbbreviationsList() abort
  let l:abbrv = HandlerForSpecialCharacters()
  call writefile([l:abbrv], expand('~/.vim/spell/words.abbr'), 'a')
  echo printf("%s %s %s", 'Added', l:abbrv, 'to ~/.vim/spell/words.abbr')
endfunction

function AddWordUnderCursorToMyWordsList() abort
  let l:cword = expand('<cword>')
  call writefile([l:cword], expand('~/.vim/spell/words.dict'), 'a')
  echo printf("%s %s %s", 'Added', l:cword, 'to ~/.vim/spell/words.dict')
endfunction

function RmTrailingSpaces() abort
  let l:pos = getpos('.')
  let l:reg = getreg('/')
  %s/\s\+$//e
  call setpos('.', l:pos)
  call setreg('/', l:reg)
endfunction

function SubsCWordWithRegZeroWhileRetainingCursorPos() abort
  let l:pos = getpos('.')
  execute printf("1,$s/%s/%s/g", expand('<cword>'), getreg('0'))
  call setpos('.', l:pos)
endfunction

function InstallMissingPlugins() abort
  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    PlugInstall --sync
  endif
endfunction

function GetBibTeXCitationKeys() abort
  let l:bfile = expand('~/.local/share/references/zotero.bib')
  let l:query = printf(":vimgrep /^@/j %s", l:bfile)
  let l:qflst = []
  let l:subst = {
        \  'lhs': '^@[^{]\+{\([A-Za-z0-9]\+\),$',
        \  'rhs': '\1',
        \}
  execute l:query
  for key in getqflist()
    let l:ctkey = substitute(key.text, l:subst['lhs'], l:subst['rhs'], 'i')
    call add(l:qflst, l:ctkey)
  endfor
  echo l:qflst
endfunction

function ChooseColorschemeAtRandom() abort
  let s:colorscheme = [
        \  'default',
        \  'desert',
        \  'elflord',
        \  'evening',
        \  'habamax',
        \  'industry',
        \  'koehler',
        \  'lunaperche',
        \  'murphy',
        \  'pablo',
        \  'quiet',
        \  'ron',
        \  'slate',
        \  'torte',
        \  'seoul256',
        \]
  let s:number_of_colorschemes = len(s:colorscheme)
  let s:seed = srand()
  let s:choice = rand(s:seed) % s:number_of_colorschemes
  execute printf("colorscheme %s", s:colorscheme[s:choice])
endfunction

function CSVDisciplines() abort
  %s/–/-/ge
  %s/\s\+/ /g
  %s/^ //g
  %s/[0-9]\{1,3}[MTN][0-9]\{1,3}/&\r/g
  g/^\(\s*\|MANHÃ\|TARDE\|NOITE\)$/d
  g/^DISCIPLINAS/d
  %s/^ //g
  %s/\s*-\s*/ ; /g
  let @q = '/^campus aparecidajma/^campus colemarkmb:''a,''bs/^/Aparecida ; /'
  execute 'norm @q'
  let @q = '/^campus colemarjma/^campus samambaiakmb:''a,''bs/^/Colemar ; /'
  execute 'norm @q'
  let @q = '/^campus samambaiajma:''a,$s/^/Samambaia ; /'
  execute 'norm @q'
  g/^CAMPUS \(APARECIDA\|COLEMAR\|SAMAMBAIA\)$/d
  %s/\([^;]\) \([0-9]\{1,3}[MTN][0-9]\{1,3}\)$/\1 ; \2/e
  %Tab /;
endfunction

function RemoveGraphicalAccents() abort
  let l:patterns = {
        \ '[àáâã]': 'a',
        \ '[éê]':   'e',
        \ 'í':      'i',
        \ '[óôõ]':  'o',
        \ 'ú':      'u',
        \ 'ç':      'c',
        \}
  for [pattern, value] in items(l:patterns)
    execute printf("1,$s/%s/%s/ge", pattern, value)
  endfor
endfunction

function GetStudentsInfoFromSIGAA() abort
  let l:regex = [
        \  '^ +([a-z ]+) +\(perfil\)',
        \  'curso: ([a-z ]+)',
        \  'matricula: ([0-9]{9})',
        \  'usuario: ([a-z0-9_.]+)',
        \  'e-mail: ([a-z0-9_.@]+) enviar mensagem',
        \]
  let l:subst = [
        \  '"\3": {',
        \  '"fname": "\1",',
        \  '"gradc": "\2",',
        \  '"uname": "\4",',
        \  '"email": "\5",',
        \  '"grade": {"E1": 0.0,"E2": 0.0,"E3": 0.0},\r},',
        \]
  let l:reg_stdnt = join(l:regex)
  let l:sub_stdnt = join(l:subst, '\r\t')
  let l:sub = printf("1,$s/\v%s/%s/", l:reg_stdnt, l:sub_stdnt)
  execute 'normal ggVGu'
  call RemoveGraphicalAccents()
  %s/\vusuario (off|on)-line no sigaa/\r/g
  g!/\((perfil)\|\(matricula\|curso\|usuario\|e-mail\):\)/d
  g/(perfil)/j
  g/curso:/j
  g/matricula:/j
  g/usuario:/j
  execute l:sub
  %s/\s\+",/",/ge
  %s/\s\+$//e
  g/^usuario:/d
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
  %s/\s\+/ /g
  g!/\.\d\{2,}/d
  %s/ \.0\(\d\)\>/ \& 0\.0\100/g
  %s/ \.\(\d\)\>/ 0\.\1/
  %s/ \.\(\d\{4}\)/ \& 0\.\1/g
  g/0\.\d\+/s/$/\\\\/
  Tab /\(&\|\\\\\)
  execute l:substitute_cmd_head
  execute l:substitute_cmd_tail
endfunction

let g:tex_flavor = 'latex'

let g:UltiSnipsSnippetDirectories  = ['~/.vim/ultisnips']
let g:UltiSnipsExpandTrigger       = '<tab>'
let g:UltiSnipsJumpForwardTrigger  = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
let g:UltiSnipsEditSplit           = 'tabdo'

let s:wiki1 = {
      \  'path': '~/.local/share/vimwiki/wiki1/',
      \  'index': 'index',
      \  'syntax': 'default',
      \  'ext': '.wiki',
      \}

let g:vimwiki_list = [s:wiki1]
