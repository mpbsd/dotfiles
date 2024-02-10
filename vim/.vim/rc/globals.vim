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
  let l:mode = {
        \  'n': {
        \    'mode': '',
        \    'desc': 'Normal'
        \  },
        \  'no': {
        \    'mode': '',
        \    'desc': 'Operator-pending'
        \  },
        \  'nov': {
        \    'mode': '',
        \    'desc': 'Operator-pending (forced characterwise |o_v|)'
        \  },
        \  'noV': {
        \    'mode': '',
        \    'desc': 'Operator-pending (forced linewise |o_V|)'
        \  },
        \  'noCTRL-V': {
        \    'mode': '',
        \    'desc': 'Operator-pending (forced blockwise |o_CTRL-V|); CTRL-V is one character'
        \  },
        \  'niI': {
        \    'mode': '',
        \    'desc': 'Normal using |i_CTRL-O| in |Insert-mode|'
        \  },
        \  'niR': {
        \    'mode': '',
        \    'desc': 'Normal using |i_CTRL-O| in |Replace-mode|'
        \  },
        \  'niV': {
        \    'mode': '',
        \    'desc': 'Normal using |i_CTRL-O| in |Virtual-Replace-mode|'
        \  },
        \  'nt': {
        \    'mode': '',
        \    'desc': 'Terminal-Normal (insert goes to Terminal-Job mode)'
        \  },
        \  'v': {
        \    'mode': '',
        \    'desc': 'Visual by character'
        \  },
        \  'vs': {
        \    'mode': '',
        \    'desc': 'Visual by character using |v_CTRL-O| in Select mode'
        \  },
        \  'V': {
        \    'mode': '',
        \    'desc': 'Visual by line'
        \  },
        \  'Vs': {
        \    'mode': '',
        \    'desc': 'Visual by line using |v_CTRL-O| in Select mode'
        \  },
        \  'CTRL-V': {
        \    'mode': '',
        \    'desc': 'Visual blockwise'
        \  },
        \  'CTRL-Vs': {
        \    'mode': '',
        \    'desc': 'Visual blockwise using |v_CTRL-O| in Select mode'
        \  },
        \  's': {
        \    'mode': '',
        \    'desc': 'Select by character'
        \  },
        \  'S': {
        \    'mode': '',
        \    'desc': 'Select by line'
        \  },
        \  'CTRL-S': {
        \    'mode': '',
        \    'desc': 'Select blockwise'
        \  },
        \  'i': {
        \    'mode': '',
        \    'desc': 'Insert'
        \  },
        \  'ic': {
        \    'mode': '',
        \    'desc': 'Insert mode completion |compl-generic|'
        \  },
        \  'ix': {
        \    'mode': '',
        \    'desc': 'Insert mode |i_CTRL-X| completion'
        \  },
        \  'R': {
        \    'mode': '',
        \    'desc': 'Replace |R|'
        \  },
        \  'Rc': {
        \    'mode': '',
        \    'desc': 'Replace mode completion |compl-generic|'
        \  },
        \  'Rx': {
        \    'mode': '',
        \    'desc': 'Replace mode |i_CTRL-X| completion'
        \  },
        \  'Rv': {
        \    'mode': '',
        \    'desc': 'Virtual Replace |gR|'
        \  },
        \  'Rvc': {
        \    'mode': '',
        \    'desc': 'Virtual Replace mode completion |compl-generic|'
        \  },
        \  'Rvx': {
        \    'mode': '',
        \    'desc': 'Virtual Replace mode |i_CTRL-X| completion'
        \  },
        \  'c': {
        \    'mode': '',
        \    'desc': 'Command-line editing'
        \  },
        \  'cv': {
        \    'mode': '',
        \    'desc': 'Vim Ex mode |gQ|'
        \  },
        \  'ce': {
        \    'mode': '',
        \    'desc': 'Normal Ex mode |Q|'
        \  },
        \  'r': {
        \    'mode': '',
        \    'desc': 'Hit-enter prompt'
        \  },
        \  'rm': {
        \    'mode': '',
        \    'desc': 'The -- more -- prompt'
        \  },
        \  'r?': {
        \    'mode': '',
        \    'desc': 'A |:confirm| query of some sort'
        \  },
        \  '!': {
        \    'mode': '',
        \    'desc': 'Shell or external command is executing'
        \  },
        \  't': {
        \    'mode': '',
        \    'desc': 'Terminal-Job mode: keys go to the job'
        \  },
        \}
  " }}}
  let l:mod = mode()
  if has_key(l:mode, l:mod)
    return l:mode[l:mod]['mode']
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
        \      'cmd': '(%06l:%06v)',
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
        \  'habamax',
        \  'lunaperche',
        \  'quiet',
        \  'slate',
        \]
  let s:number_of_colorschemes = len(s:colorscheme)
  let s:seed = srand()
  let s:choice = rand(s:seed) % s:number_of_colorschemes
  let s:cmd = 'colorscheme' . ' ' . s:colorscheme[s:choice]
  exe s:cmd
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

let s:wiki2 = {
      \  'path': '~/.local/share/vimwiki/wiki2/',
      \  'index': 'index',
      \  'syntax': 'default',
      \  'ext': '.wiki',
      \}

let g:vimwiki_list = [s:wiki1, s:wiki2]

let g:ledger_bin = 'ledger'
let g:ledger_maxwidth = 80
let g:ledger_data_format = '%Y/%m/%d'
