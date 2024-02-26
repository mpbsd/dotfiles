let g:tex_flavor = 'latex'

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

function VimModeStatusline(mode) abort
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

" function VimGitBranchNameStatusline() abort
"   let l:branch = trim(system('git branch --show-current 2>/dev/null'))
"   if strlen(l:branch) > 0
"     return l:branch
"   else
"     return ''
"   endif
" endfunction

function VimSetMyStatusline() abort
  let l:bufnr = '[%n]'
  let l:mode = '%{VimModeStatusline(mode())}'
  let l:filename_tail = '%t'
  let l:modified_flag = '%m'
  let l:lhs_rhs_separator = '%='
  let l:encoding = '%{&fenc}'
  let l:file_format = '%{&ff}'
  let l:file_type = '%Y'
  let l:percentage_through_file = '%P'
  let l:line_and_column_numbers = '(%06l:%06c)'
  let l:statusline = join([
        \ l:bufnr,
        \ l:mode,
        \ l:filename_tail,
        \ l:modified_flag,
        \ l:lhs_rhs_separator,
        \ l:encoding,
        \ l:file_format,
        \ l:file_type,
        \ l:percentage_through_file,
        \ l:line_and_column_numbers
        \])
  return l:statusline
endfunction

function RemoveGraphicalAccents() abort
  for [lhs, rhs] in items(s:table_of_equivalent_characters)
    silent execute printf("1,$s/%s/%s/ge", lhs, rhs)
  endfor
endfunction

function HandlerForSpecialCharacters() abort
  let l:cword = expand('<cword>')
  let l:pword = expand('<cword>')
  for [lhs, rhs] in items(s:table_of_equivalent_characters)
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

function VimChooseColorscheme() abort
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
