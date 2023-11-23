let s:catalogue_of_keybindings = {
      \"edit_rc_files": {
      \    "default": {
      \        "mod": "normal",
      \        "key": "<localleader>erc",
      \        "act": ":edit ~/.vim/vimrc<cr>"
      \    },
      \    "options": {
      \        "mod": "normal",
      \        "key": "<localleader>eop",
      \        "act": ":edit ~/.vim/rc/options.vim<cr>"
      \    },
      \    "globals": {
      \        "mod": "normal",
      \        "key": "<localleader>egb",
      \        "act": ":edit ~/.vim/rc/globals.vim<cr>"
      \    },
      \    "autocmd": {
      \        "mod": "normal",
      \        "key": "<localleader>eac",
      \        "act": ":edit ~/.vim/rc/autocmd.vim<cr>"
      \    },
      \    "plugins": {
      \        "mod": "normal",
      \        "key": "<localleader>epg",
      \        "act": ":edit ~/.vim/rc/plugins.vim<cr>"
      \    },
      \    "keymaps": {
      \        "mod": "normal",
      \        "key": "<localleader>ekm",
      \        "act": ":edit ~/.vim/rc/keymaps.vim<cr>"
      \    },
      \    "caching": {
      \        "mod": "normal",
      \        "key": "<localleader>eca",
      \        "act": ":edit ~/.vim/rc/caching.vim<cr>"
      \    },
      \    "guiopts": {
      \        "mod": "normal",
      \        "key": "<localleader>eui",
      \        "act": ":edit ~/.vim/rc/guiopts.vim<cr>"
      \    },
      \},
      \"source_rc_files": {
      \    "default": {
      \        "mod": "normal",
      \        "key": "<localleader>src",
      \        "act": ":source ~/.vim/vimrc.vim<cr>"
      \    },
      \    "options": {
      \        "mod": "normal",
      \        "key": "<localleader>sop",
      \        "act": ":source ~/.vim/rc/options.vim<cr>"
      \    },
      \    "globals": {
      \        "mod": "normal",
      \        "key": "<localleader>sgb",
      \        "act": ":source ~/.vim/rc/globals.vim<cr>"
      \    },
      \    "autocmd": {
      \        "mod": "normal",
      \        "key": "<localleader>sac",
      \        "act": ":source ~/.vim/rc/autocmd.vim<cr>"
      \    },
      \    "plugins": {
      \        "mod": "normal",
      \        "key": "<localleader>spg",
      \        "act": ":source ~/.vim/rc/plugins.vim<cr>"
      \    },
      \    "keymaps": {
      \        "mod": "normal",
      \        "key": "<localleader>skm",
      \        "act": ":source ~/.vim/rc/keymaps.vim<cr>"
      \    },
      \    "caching": {
      \        "mod": "normal",
      \        "key": "<localleader>sca",
      \        "act": ":source ~/.vim/rc/caching.vim<cr>"
      \    },
      \    "guiopts": {
      \        "mod": "normal",
      \        "key": "<localleader>sui",
      \        "act": ":source ~/.vim/rc/guiopts.vim<cr>"
      \    },
      \}
      \}

function Keymap(mode, keys, action)
  if a:mode ==# "normal"
    let l:c = "nnoremap " . a:keys . " " . a:action
    exe l:c
  endif
endfunction

for keybinding_category in keys(s:catalogue_of_keybindings)
  let s:category = s:catalogue_of_keybindings[keybinding_category]
  for keybinding in keys(s:category)
    let s:mod = s:category[keybinding]["mod"]
    let s:key = s:category[keybinding]["key"]
    let s:act = s:category[keybinding]["act"]
    silent call Keymap(s:mod, s:key, s:act)
  endfor
endfor

nnoremap <leader>eab :edit ~/.vim/spell/words.abbrev<cr>
nnoremap <leader>ewo :edit ~/.vim/spell/words.dict<cr>

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
