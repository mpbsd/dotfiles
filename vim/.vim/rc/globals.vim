let g:tex_flavor = 'latex'

let g:UltiSnipsSnippetDirectories  = ['~/.vim/ultisnips']
let g:UltiSnipsExpandTrigger       = '<tab>'
let g:UltiSnipsJumpForwardTrigger  = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
let g:UltiSnipsEditSplit           = 'tabdo'

let s:wiki1 = {
      \'path': '~/.local/share/vimwiki/wiki1/',
      \'index': 'index',
      \'syntax': 'default',
      \'ext': '.wiki',
      \}

let s:wiki2 = {
      \'path': '~/.local/share/vimwiki/wiki2/',
      \'index': 'index',
      \'syntax': 'default',
      \'ext': '.wiki',
      \}

let g:vimwiki_list = [s:wiki1, s:wiki2]

function VimKeymapSet(keymaps) abort
  let l:noremap = {
        \'normal': 'nnoremap',
        \'insert': 'inoremap',
        \'visual': 'vnoremap',
        \}
  for keymap in a:keymaps
    let l:mod = keymap['mod']
    let l:lhs = keymap['lhs']
    let l:rhs = keymap['rhs']
    let l:cmd = l:noremap[l:mod] . ' ' . l:lhs . ' ' . l:rhs
    exe l:cmd
  endfor
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
  echo 'Added ''' . l:abbrv . ''' to ~/.vim/spell/words.abbr'
endfunction

function AddWordUnderCursorToMyWordsList() abort
  let l:cword = expand('<cword>')
  cal writefile([l:cword], expand('~/.vim/spell/words.dict'), 'a')
  echo 'Added ''' . l:cword . ''' to ~/.vim/spell/words.dict'
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

function ShowVimMode() abort
  " modes description {{{
  let l:modes_description = {
        \  'n': {
        \    'mod': 'NORMAL',
        \    'des': 'Normal',
        \  },
        \  'no': {
        \    'mod': 'O-PENDING',
        \    'des': 'Operator-pending',
        \  },
        \  'nov': {
        \    'mod': 'O-PENDING',
        \    'des': 'Operator-pending (forced characterwise |o_v|)',
        \  },
        \  'noV': {
        \    'mod': 'O-PENDING',
        \    'des': 'Operator-pending (forced linewise |o_V|)',
        \  },
        \  'noCTRL-V': {
        \    'mod': 'O-PENDING',
        \    'des': 'Operator-pending (forced blockwise |o_CTRL-V|);',
        \  },
        \  'niI': {
        \    'mod': 'NORMAL',
        \    'des': 'Normal using |i_CTRL-O| in |Insert-mode|',
        \  },
        \  'niR': {
        \    'mod': 'NORMAL',
        \    'des': 'Normal using |i_CTRL-O| in |Replace-mode|',
        \  },
        \  'niV': {
        \    'mod': 'NORMAL',
        \    'des': 'Normal using |i_CTRL-O| in |Virtual-Replace-mode|',
        \  },
        \  'nt': {
        \    'mod': 'NORMAL',
        \    'des': 'Terminal-Normal (insert goes to Terminal-Job mode)',
        \  },
        \  'v': {
        \    'mod': 'VISUAL',
        \    'des': 'Visual by character',
        \  },
        \  'vs': {
        \    'mod': 'VISUAL',
        \    'des': 'Visual by character using |v_CTRL-O| in Select mode',
        \  },
        \  'V': {
        \    'mod': 'VISUAL',
        \    'des': 'Visual by line',
        \  },
        \  'Vs': {
        \    'mod': 'VISUAL',
        \    'des': 'Visual by line using |v_CTRL-O| in Select mode',
        \  },
        \  'CTRL-V': {
        \    'mod': 'VISUAL',
        \    'des': 'Visual blockwise',
        \  },
        \  'CTRL-Vs': {
        \    'mod': 'VISUAL',
        \    'des': 'Visual blockwise using |v_CTRL-O| in Select mode',
        \  },
        \  's': {
        \    'mod': 'SELECT',
        \    'des': 'Select by character',
        \  },
        \  'S': {
        \    'mod': 'SELECT',
        \    'des': 'Select by line',
        \  },
        \  'CTRL-S': {
        \    'mod': 'SELECT',
        \    'des': 'Select blockwise',
        \  },
        \  'i': {
        \    'mod': 'INSERT',
        \    'des': 'Insert',
        \  },
        \  'ic': {
        \    'mod': 'INSERT',
        \    'des': 'Insert mode completion |compl-generic|',
        \  },
        \  'ix': {
        \    'mod': 'INSERT',
        \    'des': 'Insert mode |i_CTRL-X| completion',
        \  },
        \  'R': {
        \    'mod': 'REPLACE',
        \    'des': 'Replace |R|',
        \  },
        \  'Rc': {
        \    'mod': 'REPLACE',
        \    'des': 'Replace mode completion |compl-generic|',
        \  },
        \  'Rx': {
        \    'mod': 'REPLACE',
        \    'des': 'Replace mode |i_CTRL-X| completion',
        \  },
        \  'Rv': {
        \    'mod': 'REPLACE',
        \    'des': 'Virtual Replace |gR|',
        \  },
        \  'Rvc': {
        \    'mod': 'REPLACE',
        \    'des': 'Virtual Replace mode completion |compl-generic|',
        \  },
        \  'Rvx': {
        \    'mod': 'REPLACE',
        \    'des': 'Virtual Replace mode |i_CTRL-X| completion',
        \  },
        \  'c': {
        \    'mod': 'COMMAND',
        \    'des': 'Command-line editing',
        \  },
        \  'cv': {
        \    'mod': 'COMMAND',
        \    'des': 'Vim Ex mode |gQ|',
        \  },
        \  'ce': {
        \    'mod': 'COMMAND',
        \    'des': 'Normal Ex mode |Q|',
        \  },
        \  'r': {
        \    'mod': 'PROMPT',
        \    'des': 'Hit-enter prompt',
        \  },
        \  'rm': {
        \    'mod': 'PROMPT',
        \    'des': 'The -- more -- prompt',
        \  },
        \  'r?': {
        \    'mod': 'CONFIRM',
        \    'des': 'A |:confirm| query of some sort',
        \  },
        \  '!': {
        \    'mod': 'EXTERNAL',
        \    'des': 'Shell or external command is executing',
        \  },
        \  't': {
        \    'mod': 'TERMINAL',
        \    'des': 'Terminal-Job mode: keys go to the job',
        \  },
        \}
  " }}}
  let l:mod = mode()
  if has_key(modes_description, l:mod)
    return modes_description[l:mod]['mod']
  endif
endfunction
