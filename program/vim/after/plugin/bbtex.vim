let $FZF_BIBTEX_CACHEDIR = expand('~/.cache/fzf-bibtex')
let $FZF_BIBTEX_SOURCES = expand('~/.local/share/bibliography/full.bib')

function! s:bibtex_cite_sink(lines) abort
  let l:r=system("bibtex-cite ", a:lines)
  execute ':normal! a' . l:r
endfunction

function! s:bibtex_markdown_sink(lines) abort
  let l:r=system("bibtex-markdown ", a:lines)
  execute ':normal! a' . l:r
endfunction

nnoremap <silent> <leader>c :call fzf#run({
      \ 'source': 'bibtex-ls',
      \ 'sink*': function('<sid>bibtex_cite_sink'),
      \ 'up': '40%',
      \ 'options': '--ansi --layout=reverse-list --multi --prompt "Cite> "'})<CR>

nnoremap <silent> <leader>m :call fzf#run({
      \ 'source': 'bibtex-ls',
      \ 'sink*': function('<sid>bibtex_markdown_sink'),
      \ 'up': '40%',
      \ 'options': '--ansi --layout=reverse-list --multi --prompt "Markdown> "'})<CR>

function! s:bibtex_cite_sink_insert(lines) abort
  let l:r=system("bibtex-cite -mode=latex", a:lines)
  execute ':normal! a' . l:r
  call feedkeys('a', 'n')
endfunction

inoremap <silent> @@ <c-g>u<c-o>:call fzf#run({
      \ 'source': 'bibtex-ls',
      \ 'sink*': function('<sid>bibtex_cite_sink_insert'),
      \ 'up': '40%',
      \ 'options': '--ansi --layout=reverse-list --multi --prompt "Cite> "'})<CR>
