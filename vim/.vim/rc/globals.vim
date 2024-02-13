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
    let l:cmd = l:noremap[l:mod] . ' ' . l:lhs . ' ' . l:rhs
    exe l:cmd
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

function SpecialCharactersHandler() abort
  let l:cword = expand('<cword>')
  let l:pword = expand('<cword>')
  let l:pword = substitute(l:pword, 'à', 'a', 'gi')
  let l:pword = substitute(l:pword, 'á', 'a', 'gi')
  let l:pword = substitute(l:pword, 'â', 'a', 'gi')
  let l:pword = substitute(l:pword, 'ã', 'a', 'gi')
  let l:pword = substitute(l:pword, 'é', 'e', 'gi')
  let l:pword = substitute(l:pword, 'ê', 'e', 'gi')
  let l:pword = substitute(l:pword, 'í', 'i', 'gi')
  let l:pword = substitute(l:pword, 'ó', 'o', 'gi')
  let l:pword = substitute(l:pword, 'ô', 'o', 'gi')
  let l:pword = substitute(l:pword, 'õ', 'o', 'gi')
  let l:pword = substitute(l:pword, 'ú', 'u', 'gi')
  let l:pword = substitute(l:pword, 'ç', 'c', 'gi')
  let l:abbrv = 'iabbrev' . ' ' . l:pword . ' ' . l:cword
  return l:abbrv
endfunction

function AddWordUnderCursorToMyAbbreviationsList() abort
  let l:abbrv = SpecialCharactersHandler()
  cal writefile([l:abbrv], expand('~/.vim/spell/words.abbr'), 'a')
  echo 'Added' . ' ' . l:abbrv . ' ' . 'to ~/.vim/spell/words.abbr'
endfunction

function AddWordUnderCursorToMyWordsList() abort
  let l:cword = expand('<cword>')
  cal writefile([l:cword], expand('~/.vim/spell/words.dict'), 'a')
  echo 'Added' . ' ' . l:cword . ' ' . 'to ~/.vim/spell/words.dict'
endfunction

function RmTrailingSpaces() abort
  let l:pos = getpos('.')
  let l:reg = getreg('/')
  sil %s/\s\+$//e
  cal setpos('.', l:pos)
  cal setreg('/', l:reg)
endfunction

function SubsCWordWithRegZeroWhileRetainingCursorPos() abort
  let l:pos = getpos('.')
  let l:cmd = '%s/' . expand('<cword>') . '/' . getreg('0') . '/g'
  sil exe l:cmd
  cal setpos('.', l:pos)
endfunction

function InstallMissingPlugins() abort
  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    PlugInstall --sync
  endif
endfunction

function ChooseBuiltinColorschemeAtRandom() abort
  let s:colorscheme = [
        \  'blue',
        \  'darkblue',
        \  'default',
        \  'delek',
        \  'desert',
        \  'elflord',
        \  'evening',
        \  'habamax',
        \  'industry',
        \  'koehler',
        \  'lunaperche',
        \  'morning',
        \  'murphy',
        \  'pablo',
        \  'peachpuff',
        \  'quiet',
        \  'ron',
        \  'shine',
        \  'slate',
        \  'torte',
        \  'zellner',
        \]
  let s:number_of_colorschemes = len(s:colorscheme)
  let s:seed = srand()
  let s:choice = rand(s:seed) % s:number_of_colorschemes
  let s:cmd = 'colorscheme' . ' ' . s:colorscheme[s:choice]
  exe s:cmd
endfunction

function GetStudentsInfoFromSIGAA() abort
  let l:regex = [
        \  '^ +([a-z ]+) \(perfil\)',
        \  'curso: ([a-z ]+)',
        \  'matricula: ([0-9]{9})',
        \  'usuario: ([a-z0-9_.]+)',
        \  'e-mail: ([a-z0-9_.@]+) enviar mensagem',
        \]
  let l:subst = [
        \  '"\3": {\r\t',
        \  '"fname": "\1",\r\t',
        \  '"gradc": "\2",\r\t',
        \  '"uname": "\4",\r\t',
        \  '"email": "\5",\r\t',
        \  '"grade": {"E1": 0.0,"E2": 0.0,"E3": 0.0},\r},',
        \]
  let l:reg_stdnt = join(l:regex)
  let l:sub_stdnt = join(l:subst, '')
  let l:sub = '%s/\v' . l:reg_stdnt . '/' . l:sub_stdnt . '/'
  sil exe 'normal ggVGu'
  sil %s/[àáâã]/a/ge
  sil %s/[éê]/e/ge
  sil %s/í/i/ge
  sil %s/[óôõ]/o/ge
  sil %s/ú/u/ge
  sil %s/ç/c/ge
  %s/\vusuario (off|on)-line no sigaa/\r/g
  g!/\((perfil)\|\(matricula\|curso\|usuario\|e-mail\):\)/d
  g/(perfil)/j
  g/curso:/j
  g/matricula:/j
  g/usuario:/j
  sil exe l:sub
  sil %s/\s\+",/",/ge
  sil %s/\s\+$//e
  sil g/^usuario:/d
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
