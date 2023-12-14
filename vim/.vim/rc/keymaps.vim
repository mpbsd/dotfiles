" catalogue_of_keybindings {{{
let s:catalogue_of_keybindings = {
      \'edit_vimrc_files': {
      \    'default': {
      \        'mod': 'normal',
      \        'key': '<leader>erc',
      \        'act': ':edit ~/.vim/vimrc<cr>',
      \    },
      \    'options': {
      \        'mod': 'normal',
      \        'key': '<leader>eop',
      \        'act': ':edit ~/.vim/rc/options.vim<cr>',
      \    },
      \    'globals': {
      \        'mod': 'normal',
      \        'key': '<leader>egb',
      \        'act': ':edit ~/.vim/rc/globals.vim<cr>',
      \    },
      \    'autocmd': {
      \        'mod': 'normal',
      \        'key': '<leader>eac',
      \        'act': ':edit ~/.vim/rc/autocmd.vim<cr>',
      \    },
      \    'plugins': {
      \        'mod': 'normal',
      \        'key': '<leader>epg',
      \        'act': ':edit ~/.vim/rc/plugins.vim<cr>',
      \    },
      \    'keymaps': {
      \        'mod': 'normal',
      \        'key': '<leader>ekm',
      \        'act': ':edit ~/.vim/rc/keymaps.vim<cr>',
      \    },
      \    'caching': {
      \        'mod': 'normal',
      \        'key': '<leader>eca',
      \        'act': ':edit ~/.vim/rc/caching.vim<cr>',
      \    },
      \    'guiopts': {
      \        'mod': 'normal',
      \        'key': '<leader>eui',
      \        'act': ':edit ~/.vim/rc/guiopts.vim<cr>',
      \    },
      \},
      \'source_vimrc_files': {
      \    'default': {
      \        'mod': 'normal',
      \        'key': '<leader>src',
      \        'act': ':source ~/.vim/vimrc.vim<cr>',
      \    },
      \    'options': {
      \        'mod': 'normal',
      \        'key': '<leader>sop',
      \        'act': ':source ~/.vim/rc/options.vim<cr>',
      \    },
      \    'globals': {
      \        'mod': 'normal',
      \        'key': '<leader>sgb',
      \        'act': ':source ~/.vim/rc/globals.vim<cr>',
      \    },
      \    'autocmd': {
      \        'mod': 'normal',
      \        'key': '<leader>sac',
      \        'act': ':source ~/.vim/rc/autocmd.vim<cr>',
      \    },
      \    'plugins': {
      \        'mod': 'normal',
      \        'key': '<leader>spg',
      \        'act': ':source ~/.vim/rc/plugins.vim<cr>',
      \    },
      \    'keymaps': {
      \        'mod': 'normal',
      \        'key': '<leader>skm',
      \        'act': ':source ~/.vim/rc/keymaps.vim<cr>',
      \    },
      \    'caching': {
      \        'mod': 'normal',
      \        'key': '<leader>sca',
      \        'act': ':source ~/.vim/rc/caching.vim<cr>',
      \    },
      \    'guiopts': {
      \        'mod': 'normal',
      \        'key': '<leader>sui',
      \        'act': ':source ~/.vim/rc/guiopts.vim<cr>',
      \    },
      \},
      \'dealing_with_files_in_general': {
      \    'saving': {
      \        'mod': 'normal',
      \        'key': '<leader>fw',
      \        'act': ':w<cr>',
      \    },
      \},
      \'back_to_normal_mode': {
      \    'from_insert_mode_1': {
      \        'mod': 'insert',
      \        'key': 'jj',
      \        'act': '<esc>',
      \    },
      \    'from_insert_mode_2': {
      \        'mod': 'insert',
      \        'key': 'jk',
      \        'act': '<esc>',
      \    },
      \},
      \'get_into_cmd_mode': {
      \    'from_normal_mode': {
      \        'mod': 'normal',
      \        'key': '<leader>;',
      \        'act': ':',
      \    },
      \},
      \'window_management': {
      \    'closing': {
      \        'mod': 'normal',
      \        'key': '<leader>fq',
      \        'act': ':q<cr>',
      \    },
      \    'move_focus_to_the_left_window': {
      \        'mod': 'normal',
      \        'key': '<c-h>',
      \        'act': '<c-w>h',
      \    },
      \    'move_focus_to_the_downward_window': {
      \        'mod': 'normal',
      \        'key': '<c-j>',
      \        'act': '<c-w>j',
      \    },
      \    'move_focus_to_the_upward_window': {
      \        'mod': 'normal',
      \        'key': '<c-k>',
      \        'act': '<c-w>k',
      \    },
      \    'move_focus_to_the_right_window': {
      \        'mod': 'normal',
      \        'key': '<c-l>',
      \        'act': '<c-w>l',
      \    },
      \    'split_the_window_vertically': {
      \        'mod': 'normal',
      \        'key': '<leader>sp',
      \        'act': ':sp<cr>',
      \    },
      \    'split_the_window_horizontally': {
      \        'mod': 'normal',
      \        'key': '<leader>vs',
      \        'act': ':vs<cr>',
      \    },
      \    'increase_width': {
      \        'mod': 'normal',
      \        'key': '<c-left>',
      \        'act': '<c-w>>',
      \    },
      \    'decrease_height': {
      \        'mod': 'normal',
      \        'key': '<c-down>',
      \        'act': '<c-w>-',
      \    },
      \    'increase_height': {
      \        'mod': 'normal',
      \        'key': '<c-up>',
      \        'act': '<c-w>+',
      \    },
      \    'decrease_width': {
      \        'mod': 'normal',
      \        'key': '<c-right>',
      \        'act': '<c-w><',
      \    },
      \},
      \'abbreviations_and_dictionary': {
      \    'add_word_under_the_cursor_to_abbreviations_list': {
      \        'mod': 'normal',
      \        'key': '<leader>ab',
      \        'act': ':call AddWordUnderCursorToMyAbbreviationsList()<cr>',
      \    },
      \    'add_word_under_the_cursor_to_words_list': {
      \        'mod': 'normal',
      \        'key': '<leader>aw',
      \        'act': ':call AddWordUnderCursorToMyWordsList()<cr>',
      \    },
      \    'abbreviations': {
      \        'mod': 'normal',
      \        'key': '<leader>eab',
      \        'act': ':edit ~/.vim/spell/words.abbr<cr>',
      \    },
      \    'dictionary': {
      \        'mod': 'normal',
      \        'key': '<leader>ewo',
      \        'act': ':edit ~/.vim/spell/words.dict<cr>',
      \    },
      \},
      \'plugins': {
      \    'install': {
      \        'mod': 'normal',
      \        'key': '<leader>pi',
      \        'act': ':PlugInstall<cr>',
      \    },
      \    'update': {
      \        'mod': 'normal',
      \        'key': '<leader>pu',
      \        'act': ':PlugUpdate<cr>',
      \    },
      \    'upgrade': {
      \        'mod': 'normal',
      \        'key': '<leader>pg',
      \        'act': ':PlugUpgrade<cr>',
      \    },
      \    'clean': {
      \        'mod': 'normal',
      \        'key': '<leader>pc',
      \        'act': ':PlugClean<cr>',
      \    },
      \},
      \'change_capitalization_of_words': {
      \    'to_upper_case': {
      \        'mod': 'insert',
      \        'key': '<leader>tu',
      \        'act': '<esc>mmbgUiw`ma',
      \    },
      \    'to_lower_case': {
      \        'mod': 'insert',
      \        'key': '<leader>tl',
      \        'act': '<esc>mmbguiw`ma',
      \    },
      \    'captilize_the_first_letter': {
      \        'mod': 'insert',
      \        'key': '<leader>cc',
      \        'act': '<esc>mmb~`ma',
      \    },
      \},
      \'search_and_replace': {
      \    'subs_word_under_the_cursor_with_the_contents_of_register_0': {
      \        'mod': 'normal',
      \        'key': '<leader>rw',
      \        'act': ':call BetterSubstitution()<cr>',
      \    },
      \},
      \'fuzzy_file_finding': {
      \    'searching_by_filename': {
      \        'mod': 'normal',
      \        'key': '<leader>sf',
      \        'act': ':FZF<cr>',
      \    },
      \    'searching_by_contents': {
      \        'mod': 'normal',
      \        'key': '<leader>sa',
      \        'act': ':Ag<cr>',
      \    },
      \},
      \'edit_snippets': {
      \    'ultisnipsedit': {
      \        'mod': 'normal',
      \        'key': '<leader>se',
      \        'act': ':UltiSnipsEdit<cr>',
      \    },
      \},
      \'manpages': {
      \    'opening': {
      \        'mod': 'normal',
      \        'key': '<leader>mp',
      \        'act': ':Man ',
      \    },
      \},
      \'useful_regexes': {
      \    'change_capitalization_of_D[aeo]s?': {
      \        'mod': 'normal',
      \        'key': '<leader>cd',
      \        'act': ':%s@\\<D\\([aeo]s\\?\\)\\>@d\\1@g<cr>',
      \    },
      \    'convert_data_to_iso_format': {
      \        'mod': 'normal',
      \        'key': '<leader>id',
      \        'act': ':%s@\\(0[1-9]\\\\|[12][0-9]\\\\|3[01]\\)\\/\\(0[1-9]\\\\|1[012]\\)\\/\\(202[3-9]\\)@\\3-\\2-\\1@g<cr>',
      \    },
      \    'convert_values_to_the_ledger_format': {
      \        'mod': 'normal',
      \        'key': '<leader>im',
      \        'act': ':%s@R$\\s\\+\\([0-9.]\\+\\),\\([0-9]\\+\\)\\s(\\([+-]\\))$@\\3\\1\\.\\2\\ BRL@<cr>',
      \    },
      \},
      \}
" }}}

function Keymap(mod, key, act)
  let l:mod = {
        \'normal': 'nnoremap',
        \'insert': 'inoremap',
        \}
  let l:cmd = l:mod[a:mod] . ' ' . a:key . ' ' . a:act
  exe l:cmd
endfunction

for category in values(s:catalogue_of_keybindings)
  for keybinding in values(category)
    let s:mod = keybinding['mod']
    let s:key = keybinding['key']
    let s:act = keybinding['act']
    sil call Keymap(s:mod, s:key, s:act)
  endfor
endfor
