if filereadable(expand('~/.vim/plugged/vim-airline/plugin/airline.vim'))
  let g:airline_symbols_ascii = 1
  let g:airline_section_c = '%t'
  let g:airline_section_y = '%{&fileencoding} %{&fileformat}'
  let g:airline_section_z = '%P (%06l:%06c)'
  let g:airline_extensions = ['branch', 'tabline']
  let g:airline#extensions#tabline#fnamemod = ':t:.'
endif

if filereadable(expand('~/.vim/plugged/vim-colors-solarized/colors/solarized.vim'))
  let g:solarized_termcolors = 16
  let g:solarized_termtrans = 0
  let g:solarized_degrade = 0
  let g:solarized_bold = 1
  let g:solarized_underline = 0
  let g:solarized_italic = 1
  let g:solarized_contrast = 'normal'
  let g:solarized_visibility = 'normal'
  let g:solarized_hitrail = 0
  let g:solarized_menu = 1
  colorscheme solarized
endif

if filereadable(expand('~/.vim/plugged/vim-abolish/plugin/abolish.vim'))
  let g:abolish_save_file = expand('~/.vim/after/plugin/abbrv.vim')
endif

if filereadable(expand('~/.vim/plugged/ultisnips/plugin/UltiSnips.vim'))
  let g:UltiSnipsSnippetDirectories = [expand('~/.vim/ultisnips')]
  let g:UltiSnipsExpandTrigger = "<Tab>"
  let g:UltiSnipsJumpForwardTrigger = "<Tab>"
  let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
  let g:UltiSnipsEditSplit = "tabdo"
endif

if filereadable(expand('~/.vim/plugged/vimtex/plugin/vimtex.vim'))
  let g:vimtex_compiler_enabled = v:false
  let g:vimtex_format_enabled = v:false
  let g:vimtex_imaps_enabled = v:false
  let g:vimtex_indent_enabled = v:false
endif
