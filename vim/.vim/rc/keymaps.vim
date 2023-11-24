" catalogue_of_keybindings {{{
let s:catalogue_of_keybindings = {
      \"edit_rc_files": {
      \    "default": {
      \        "mod": "normal",
      \        "key": "<localleader>erc",
      \        "act": ":edit ~/.vim/vimrc<cr>",
      \    },
      \    "options": {
      \        "mod": "normal",
      \        "key": "<localleader>eop",
      \        "act": ":edit ~/.vim/rc/options.vim<cr>",
      \    },
      \    "globals": {
      \        "mod": "normal",
      \        "key": "<localleader>egb",
      \        "act": ":edit ~/.vim/rc/globals.vim<cr>",
      \    },
      \    "autocmd": {
      \        "mod": "normal",
      \        "key": "<localleader>eac",
      \        "act": ":edit ~/.vim/rc/autocmd.vim<cr>",
      \    },
      \    "plugins": {
      \        "mod": "normal",
      \        "key": "<localleader>epg",
      \        "act": ":edit ~/.vim/rc/plugins.vim<cr>",
      \    },
      \    "keymaps": {
      \        "mod": "normal",
      \        "key": "<localleader>ekm",
      \        "act": ":edit ~/.vim/rc/keymaps.vim<cr>",
      \    },
      \    "caching": {
      \        "mod": "normal",
      \        "key": "<localleader>eca",
      \        "act": ":edit ~/.vim/rc/caching.vim<cr>",
      \    },
      \    "guiopts": {
      \        "mod": "normal",
      \        "key": "<localleader>eui",
      \        "act": ":edit ~/.vim/rc/guiopts.vim<cr>",
      \    },
      \},
      \"source_rc_files": {
      \    "default": {
      \        "mod": "normal",
      \        "key": "<localleader>src",
      \        "act": ":source ~/.vim/vimrc.vim<cr>",
      \    },
      \    "options": {
      \        "mod": "normal",
      \        "key": "<localleader>sop",
      \        "act": ":source ~/.vim/rc/options.vim<cr>",
      \    },
      \    "globals": {
      \        "mod": "normal",
      \        "key": "<localleader>sgb",
      \        "act": ":source ~/.vim/rc/globals.vim<cr>",
      \    },
      \    "autocmd": {
      \        "mod": "normal",
      \        "key": "<localleader>sac",
      \        "act": ":source ~/.vim/rc/autocmd.vim<cr>",
      \    },
      \    "plugins": {
      \        "mod": "normal",
      \        "key": "<localleader>spg",
      \        "act": ":source ~/.vim/rc/plugins.vim<cr>",
      \    },
      \    "keymaps": {
      \        "mod": "normal",
      \        "key": "<localleader>skm",
      \        "act": ":source ~/.vim/rc/keymaps.vim<cr>",
      \    },
      \    "caching": {
      \        "mod": "normal",
      \        "key": "<localleader>sca",
      \        "act": ":source ~/.vim/rc/caching.vim<cr>",
      \    },
      \    "guiopts": {
      \        "mod": "normal",
      \        "key": "<localleader>sui",
      \        "act": ":source ~/.vim/rc/guiopts.vim<cr>",
      \    },
      \},
      \"edit_abbreviations_and_dictionary": {
      \    "abbreviations": {
      \        "mod": "normal",
      \        "key": "<localleader>eab",
      \        "act": ":edit ~/.vim/spell/words.abbr<cr>",
      \    },
      \    "dictionary": {
      \        "mod": "normal",
      \        "key": "<localleader>ewo",
      \        "act": ":edit ~/.vim/spell/words.dict<cr>",
      \    },
      \},
      \"window_management": {
      \    "move_focus_to_windows_on_the_left": {
      \        "mod": "normal",
      \        "key": "<c-h>",
      \        "act": "<c-w>h",
      \    },
      \    "move_focus_to_the_downward_window": {
      \        "mod": "normal",
      \        "key": "<c-j>",
      \        "act": "<c-w>j",
      \    },
      \    "move_focus_to_the_upward_window": {
      \        "mod": "normal",
      \        "key": "<c-k>",
      \        "act": "<c-w>k",
      \    },
      \    "move_focus_to_windows_on_the_right": {
      \        "mod": "normal",
      \        "key": "<c-l>",
      \        "act": "<c-w>l",
      \    },
      \    "split_the_window_vertically": {
      \        "mod": "normal",
      \        "key": "<localleader>sp",
      \        "act": ":sp<cr>",
      \    },
      \    "split_the_window_horizontally": {
      \        "mod": "normal",
      \        "key": "<localleader>vs",
      \        "act": ":vs<cr>",
      \    },
      \    "increase_width": {
      \        "mod": "normal",
      \        "key": "<c-left>",
      \        "act": "<c-w>>",
      \    },
      \    "decrease_height": {
      \        "mod": "normal",
      \        "key": "<c-down>",
      \        "act": "<c-w>-",
      \    },
      \    "increase_height": {
      \        "mod": "normal",
      \        "key": "<c-up>",
      \        "act": "<c-w>+",
      \    },
      \    "decrease_width": {
      \        "mod": "normal",
      \        "key": "<c-right>",
      \        "act": "<c-w><",
      \    },
      \},
      \"plugins": {
      \    "install": {
      \        "mod": "normal",
      \        "key": "<localleader>pi",
      \        "act": ":PlugInstall<cr>",
      \    },
      \    "update": {
      \        "mod": "normal",
      \        "key": "<localleader>pu",
      \        "act": ":PlugUpdate<cr>",
      \    },
      \    "upgrade": {
      \        "mod": "normal",
      \        "key": "<localleader>pg",
      \        "act": ":PlugUpgrade<cr>",
      \    },
      \    "clean": {
      \        "mod": "normal",
      \        "key": "<localleader>pc",
      \        "act": ":PlugClean<cr>",
      \    },
      \},
      \"change_capitalization_of_words": {
      \    "to_upper_case": {
      \        "mod": "insert",
      \        "key": "<localleader>tu",
      \        "act": "<esc>mmbgUiw`ma",
      \    },
      \    "to_lower_case": {
      \        "mod": "insert",
      \        "key": "<localleader>tl",
      \        "act": "<esc>mmbguiw`ma",
      \    },
      \    "captilize_the_first_letter": {
      \        "mod": "insert",
      \        "key": "<localleader>cc",
      \        "act": "<esc>mmb~`ma",
      \    },
      \},
      \"abbreviations": {
      \    "add_word_under_the_cursor_to_abbreviations_list": {
      \        "mod": "normal",
      \        "key": "<localleader>ab",
      \        "act": ":call AddWordUnderCursorToMyAbbreviationsList()<cr>",
      \    },
      \    "add_word_under_the_cursor_to_words_list": {
      \        "mod": "normal",
      \        "key": "<localleader>aw",
      \        "act": ":call AddWordUnderCursorToMyWordsList()<cr>",
      \    },
      \},
      \"get_back_to_normal_mode": {
      \    "from_insert_mode": {
      \        "mod": "insert",
      \        "key": "jj",
      \        "act": "<esc>",
      \    },
      \},
      \"get_into_cmd_mode": {
      \    "from_normal_mode": {
      \        "mod": "normal",
      \        "key": "<localleader>;",
      \        "act": ":",
      \    },
      \},
      \"dealing_with_general_files": {
      \    "saving": {
      \        "mod": "normal",
      \        "key": "<localleader>fw",
      \        "act": ":w<cr>",
      \    },
      \    "quitting": {
      \        "mod": "normal",
      \        "key": "<localleader>fq",
      \        "act": ":q<cr>",
      \    },
      \},
      \"fuzzy_file_finding": {
      \    "searching_by_filename": {
      \        "mod": "normal",
      \        "key": "<localleader>sf",
      \        "act": ":FZF<cr>",
      \    },
      \    "searching_by_contents": {
      \        "mod": "normal",
      \        "key": "<localleader>sa",
      \        "act": ":Ag<cr>",
      \    },
      \},
      \"edit_snippets": {
      \    "ultisnipsedit": {
      \        "mod": "normal",
      \        "key": "<localleader>se",
      \        "act": ":UltiSnipsEdit<cr>",
      \    },
      \},
      \"useful_regexes": {
      \    "change_capitalization_of_D[aeo]s?": {
      \        "mod": "normal",
      \        "key": "<localleader>cd",
      \        "act": ":%s@\\<D\\([aeo]s\\?\\)\\>@d\\1@g<cr>",
      \    },
      \    "change_date_iso_format": {
      \        "mod": "normal",
      \        "key": "<localleader>id",
      \        "act": ":%s@\\(0[1-9]\\\\|[12][0-9]\\\\|3[01]\\)\\/\\(0[1-9]\\\\|1[012]\\)\\/\\(202[3-9]\\)@\\3-\\2-\\1@g<cr>",
      \    },
      \    "convert_values_to_the_ledger_format": {
      \        "mod": "normal",
      \        "key": "<localleader>im",
      \        "act": ":%s@R$\\s\\+\\([0-9.]\\+\\),\\([0-9]\\+\\)\\s(\\([+-]\\))$@\\3\\1\\.\\2\\ BRL@<cr>",
      \    },
      \},
      \}
" }}}

function Keymap(mode, keys, action)
  let l:mod = {
        \"normal": "nnoremap",
        \"insert": "inoremap",
        \}
  let l:cmd = l:mod[a:mode] . " " . a:keys . " " . a:action
  exe l:cmd
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
