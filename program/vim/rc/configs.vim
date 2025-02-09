let s:b = '~/.vim/plugged/vim-airline/plugin/airline.vim'
let s:c = '~/.vim/plugged/vim-airline-themes/plugin/airline-themes.vim'

if !empty(glob(s:b)) && !empty(glob(s:c))
  let g:airline_symbols_ascii = 1
  let g:airline_section_c = '%t'
  let g:airline_section_y = '%{&fileencoding} %{&fileformat}'
  let g:airline_section_z = '%P (%06l:%06c)'
  let g:airline_extensions = ['branch', 'tabline']
  let g:airline#extensions#tabline#fnamemod = ':t:.'
  let g:airline_theme = 'minimalist'
endif

if !empty(glob('~/.vim/plugged/ultisnips/plugin/UltiSnips.vim'))
  let g:UltiSnipsSnippetDirectories = [expand('~/.vim/ultisnips')]
  let g:UltiSnipsExpandTrigger = '<Tab>'
  let g:UltiSnipsJumpForwardTrigger = '<Tab>'
  let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
  let g:UltiSnipsEditSplit = 'tabdo'
endif

if !empty(glob('~/.vim/plugged/vimtex/plugin/vimtex.vim'))
  let g:vimtex_compiler_enabled = v:false
  let g:vimtex_imaps_enabled = v:false
endif
