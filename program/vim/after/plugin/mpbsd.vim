function! mpbsd#vim_search_for_help_in_new(sp_vs_tab) abort
  if a:sp_vs_tab ==# 'v'
    let l:help_cmd = ':vert help'
  elseif a:sp_vs_tab ==# 't'
    let l:help_cmd = ':tab help'
  else
    let l:help_cmd = ':help'
  endif
  let l:search_for_help = input(':help ')
  execute printf("%s %s", l:help_cmd, l:search_for_help)
endfunction

function! mpbsd#vim_find_help_cword(cword) abort
  execute printf(":vert help %s", a:cword)
endfunction

function mpbsd#vim_rm_trailing_spaces_from_cbuffer() abort
  let l:pos = getpos('.')
  let l:reg = getreg('/')
  silent %s/\s\+$//e
  call setpos('.', l:pos)
  call setreg('/', l:reg)
endfunction

function mpbsd#table_of_ascii_equivalent_characters() abort
  " ascii_equivalent_chars {{{
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
  " }}}
  return l:ascii_equivalent_chars
endfunction

function mpbsd#vim_rm_non_ascii_chars_from_cbuffer() abort
  let l:pos = getpos('.')
  let l:reg = getreg('/')
  for [lhs, rhs] in items(mpbsd#table_of_ascii_equivalent_characters())
    silent execute printf("1,$s/%s/%s/ge", lhs, rhs)
  endfor
  call setpos('.', l:pos)
  call setreg('/', l:reg)
endfunction

function mpbsd#vim_format_my_BibTeX_file() abort
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

augroup awesome_csv
  autocmd!
  autocmd FileType csv setlocal nowrap
augroup END

augroup awesome_emailing
  autocmd!
  autocmd FileType mail setlocal spell
augroup END

augroup set_foldmethod_to_marker_for_these_filetypes
  autocmd!
  autocmd FileType c,h,python,sh,vim setlocal foldmethod=marker
augroup END

augroup get_rid_of_trailing_spaces
  autocmd!
  let s:filetype = [
        \'json',
        \'lua',
        \'py',
        \'sh',
        \'txt',
        \'vim',
        \]
  for ft in s:filetype
    autocmd BufWritePre '*.' . ft :call mpbsd#vim_rm_trailing_spaces_from_cbuffer()
  endfor
augroup END
