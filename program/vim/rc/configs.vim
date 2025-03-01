let s:A = '~/.vim/plugged/vim-airline/plugin/airline.vim'
let s:B = '~/.vim/plugged/vim-airline-themes/plugin/airline-themes.vim'
let s:C = '~/.vim/plugged/vim-colors-solarized/colors/solarized.vim'

if !empty(glob(s:A)) && !empty(glob(s:B))
  let g:airline_symbols_ascii = 1
  let g:airline_section_c = '%t'
  let g:airline_section_y = '%{&fileencoding} %{&fileformat}'
  let g:airline_section_z = '%P (%06l:%06c)'
  let g:airline_extensions = ['branch', 'tabline']
  let g:airline#extensions#tabline#fnamemod = ':t:.'
  if !empty(glob(s:C))
    colorscheme solarized
    let g:airline_theme = 'solarized'
  else
    colorscheme habamax
    let g:airline_theme = 'minimalist'
  endif
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
