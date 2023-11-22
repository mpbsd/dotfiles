let s:keymap = {
      \"edit_rc_files": {
      \"options": {
      \"mode": "normal",
      \"keys": "<leader>eop",
      \"action": ":edit ~/.vim/rc/options.vim<cr>"
      \},
      \},
      \}

function Keymap(mode, keys, action)
  if a:mode ==# "normal"
    let l:c = "nnoremap " . a:keys . " " . a:action
    exe l:c
  endif
endfunction

for keybindingCategory in keys(s:keymap)
  let s:keybindings = s:keymap[keybindingCategory]
  for keybinding in keys(s:keybindings)
    let s:keymap = s:keybindings[keybinding]
    let s:mode = s:keymap["mode"]
    let s:keys = s:keymap["keys"]
    let s:action = s:keymap["action"]
    silent call Keymap(s:mode, s:keys, s:action)
  endfor
endfor

" edit/source config files {{{
nnoremap <leader>erc :edit ~/.vim/vimrc<cr>

" nnoremap <leader>eop :edit ~/.vim/rc/options.vim<cr>
nnoremap <leader>epg :edit ~/.vim/rc/plugins.vim<cr>
nnoremap <leader>eau :edit ~/.vim/rc/autocmd.vim<cr>
nnoremap <leader>egb :edit ~/.vim/rc/globals.vim<cr>
nnoremap <leader>ekm :edit ~/.vim/rc/keymaps.vim<cr>

nnoremap <leader>src :source ~/.vim/vimrc<cr>

nnoremap <leader>sop :source ~/.vim/rc/options.vim<cr>
nnoremap <leader>spg :source ~/.vim/rc/plugins.vim<cr>
nnoremap <leader>sau :source ~/.vim/rc/autocmd.vim<cr>
nnoremap <leader>sgb :source ~/.vim/rc/globals.vim<cr>
nnoremap <leader>skm :source ~/.vim/rc/keymaps.vim<cr>

nnoremap <leader>eab :edit ~/.vim/spell/words.abbrev<cr>
nnoremap <leader>ewo :edit ~/.vim/spell/words.dict<cr>
" }}}
" windows {{{
nnoremap <localleader>sp :sp<cr>
nnoremap <localleader>vs :vs<cr>
" navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
" resizing
nnoremap <c-left>  <c-w>>
nnoremap <c-down>  <c-w>-
nnoremap <c-up>    <c-w>+
nnoremap <c-right> <c-w><
" }}}
" plugin management {{{
nnoremap <localleader>pc :PlugClean<cr>
nnoremap <localleader>pg :PlugUpgrade<cr>
nnoremap <localleader>pi :PlugInstall<cr>
nnoremap <localleader>pu :PlugUpdate<cr>
" }}}
" capitalization {{{
inoremap <localleader>tu <esc>mmbgUiw`ma
inoremap <localleader>tl <esc>mmbguiw`ma
inoremap <localleader>cc <esc>mmb~`ma
" }}}
" abbreviations {{{
nnoremap <localleader>aa :source ~/.vim/spell/words.abbrev<cr>
nnoremap <localleader>ab :call AddWordUnderCursorToMyAbbreviationsList()<cr>
nnoremap <localleader>aw :call AddWordUnderCursorToMyWordsList()<cr>
"}}}

inoremap jj <esc>
nnoremap <leader>; :

nnoremap <localleader>fw :w<cr>
nnoremap <localleader>fq :q<cr>

nnoremap <localleader>ex :Explore<cr>

nnoremap <localleader>sf :FZF<cr>
nnoremap <localleader>sa :Ag<cr>

nnoremap <localleader>se :UltiSnipsEdit<cr>

nnoremap <localleader>cd :%s/\<D\([aeo]s\?\)\>/d\1/g<cr>

nnoremap <localleader>id :%s@\(0[1-9]\\|[12][0-9]\\|3[01]\)\/\(0[1-9]\\|1[012]\)\/\(202[3-9]\)@\3-\2-\1@g<cr>
nnoremap <localleader>im :%s@\([0-9.]\+\),\([0-9]\+\)\s(\([+-]\))$@\3\1\.\2\ BRL@<cr>
