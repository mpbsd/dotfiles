" catalogue_of_keybindings {{{
let s:catalogue_of_keybindings = {
      \'edit_vimrc_files': {
      \    'default': {
      \        'mod': 'normal',
      \        'lhs': '<leader>erc',
      \        'rhs': ':edit ~/.vim/vimrc<cr>',
      \    },
      \    'speller': {
      \        'mod': 'normal',
      \        'lhs': '<leader>esp',
      \        'rhs': ':edit ~/.vim/rc/speller.vim<cr>',
      \    },
      \    'snippet': {
      \        'mod': 'normal',
      \        'lhs': '<leader>esn',
      \        'rhs': ':edit ~/.vim/rc/snippet.vim<cr>',
      \    },
      \    'options': {
      \        'mod': 'normal',
      \        'lhs': '<leader>eop',
      \        'rhs': ':edit ~/.vim/rc/options.vim<cr>',
      \    },
      \    'globals': {
      \        'mod': 'normal',
      \        'lhs': '<leader>egb',
      \        'rhs': ':edit ~/.vim/rc/globals.vim<cr>',
      \    },
      \    'autocmd': {
      \        'mod': 'normal',
      \        'lhs': '<leader>eac',
      \        'rhs': ':edit ~/.vim/rc/autocmd.vim<cr>',
      \    },
      \    'plugins': {
      \        'mod': 'normal',
      \        'lhs': '<leader>epg',
      \        'rhs': ':edit ~/.vim/rc/plugins.vim<cr>',
      \    },
      \    'keymaps': {
      \        'mod': 'normal',
      \        'lhs': '<leader>ekm',
      \        'rhs': ':edit ~/.vim/rc/keymaps.vim<cr>',
      \    },
      \    'caching': {
      \        'mod': 'normal',
      \        'lhs': '<leader>eca',
      \        'rhs': ':edit ~/.vim/rc/caching.vim<cr>',
      \    },
      \    'guiopts': {
      \        'mod': 'normal',
      \        'lhs': '<leader>eui',
      \        'rhs': ':edit ~/.vim/rc/guiopts.vim<cr>',
      \    },
      \},
      \'source_vimrc_files': {
      \    'default': {
      \        'mod': 'normal',
      \        'lhs': '<leader>src',
      \        'rhs': ':source ~/.vim/vimrc<cr>',
      \    },
      \    'speller': {
      \        'mod': 'normal',
      \        'lhs': '<leader>ssp',
      \        'rhs': ':source ~/.vim/rc/speller.vim<cr>',
      \    },
      \    'snippet': {
      \        'mod': 'normal',
      \        'lhs': '<leader>ssn',
      \        'rhs': ':source ~/.vim/rc/snippet.vim<cr>',
      \    },
      \    'options': {
      \        'mod': 'normal',
      \        'lhs': '<leader>sop',
      \        'rhs': ':source ~/.vim/rc/options.vim<cr>',
      \    },
      \    'globals': {
      \        'mod': 'normal',
      \        'lhs': '<leader>sgb',
      \        'rhs': ':source ~/.vim/rc/globals.vim<cr>',
      \    },
      \    'autocmd': {
      \        'mod': 'normal',
      \        'lhs': '<leader>sac',
      \        'rhs': ':source ~/.vim/rc/autocmd.vim<cr>',
      \    },
      \    'plugins': {
      \        'mod': 'normal',
      \        'lhs': '<leader>spg',
      \        'rhs': ':source ~/.vim/rc/plugins.vim<cr>',
      \    },
      \    'keymaps': {
      \        'mod': 'normal',
      \        'lhs': '<leader>skm',
      \        'rhs': ':source ~/.vim/rc/keymaps.vim<cr>',
      \    },
      \    'caching': {
      \        'mod': 'normal',
      \        'lhs': '<leader>sca',
      \        'rhs': ':source ~/.vim/rc/caching.vim<cr>',
      \    },
      \    'guiopts': {
      \        'mod': 'normal',
      \        'lhs': '<leader>sui',
      \        'rhs': ':source ~/.vim/rc/guiopts.vim<cr>',
      \    },
      \},
      \'dealing_with_files_in_general': {
      \    'saving': {
      \        'mod': 'normal',
      \        'lhs': '<leader>fw',
      \        'rhs': ':w<cr>',
      \    },
      \},
      \'back_to_normal_mode': {
      \    'from_insert_mode_1': {
      \        'mod': 'insert',
      \        'lhs': 'jj',
      \        'rhs': '<esc>',
      \    },
      \    'from_insert_mode_2': {
      \        'mod': 'insert',
      \        'lhs': 'jk',
      \        'rhs': '<esc>',
      \    },
      \},
      \'get_into_cmd_mode': {
      \    'from_normal_mode': {
      \        'mod': 'normal',
      \        'lhs': '<leader>;',
      \        'rhs': ':',
      \    },
      \},
      \'window_management': {
      \    'closing': {
      \        'mod': 'normal',
      \        'lhs': '<leader>fq',
      \        'rhs': ':q<cr>',
      \    },
      \    'move_focus_to_the_left_window': {
      \        'mod': 'normal',
      \        'lhs': '<c-h>',
      \        'rhs': '<c-w>h',
      \    },
      \    'move_focus_to_the_downward_window': {
      \        'mod': 'normal',
      \        'lhs': '<c-j>',
      \        'rhs': '<c-w>j',
      \    },
      \    'move_focus_to_the_upward_window': {
      \        'mod': 'normal',
      \        'lhs': '<c-k>',
      \        'rhs': '<c-w>k',
      \    },
      \    'move_focus_to_the_right_window': {
      \        'mod': 'normal',
      \        'lhs': '<c-l>',
      \        'rhs': '<c-w>l',
      \    },
      \    'split_the_window_vertically': {
      \        'mod': 'normal',
      \        'lhs': '<leader>sp',
      \        'rhs': ':sp<cr>',
      \    },
      \    'split_the_window_horizontally': {
      \        'mod': 'normal',
      \        'lhs': '<leader>vs',
      \        'rhs': ':vs<cr>',
      \    },
      \    'increase_width': {
      \        'mod': 'normal',
      \        'lhs': '<c-left>',
      \        'rhs': '<c-w>>',
      \    },
      \    'decrease_height': {
      \        'mod': 'normal',
      \        'lhs': '<c-down>',
      \        'rhs': '<c-w>-',
      \    },
      \    'increase_height': {
      \        'mod': 'normal',
      \        'lhs': '<c-up>',
      \        'rhs': '<c-w>+',
      \    },
      \    'decrease_width': {
      \        'mod': 'normal',
      \        'lhs': '<c-right>',
      \        'rhs': '<c-w><',
      \    },
      \},
      \'abbreviations_and_dictionary': {
      \    'add_word_under_the_cursor_to_abbreviations_list': {
      \        'mod': 'normal',
      \        'lhs': '<leader>ab',
      \        'rhs': ':call AddWordUnderCursorToMyAbbreviationsList()<cr>',
      \    },
      \    'add_word_under_the_cursor_to_words_list': {
      \        'mod': 'normal',
      \        'lhs': '<leader>aw',
      \        'rhs': ':call AddWordUnderCursorToMyWordsList()<cr>',
      \    },
      \    'abbreviations': {
      \        'mod': 'normal',
      \        'lhs': '<leader>eab',
      \        'rhs': ':edit ~/.vim/spell/words.abbr<cr>',
      \    },
      \    'dictionary': {
      \        'mod': 'normal',
      \        'lhs': '<leader>ewo',
      \        'rhs': ':edit ~/.vim/spell/words.dict<cr>',
      \    },
      \},
      \'plugins': {
      \    'install': {
      \        'mod': 'normal',
      \        'lhs': '<leader>pi',
      \        'rhs': ':PlugInstall<cr>',
      \    },
      \    'update': {
      \        'mod': 'normal',
      \        'lhs': '<leader>pu',
      \        'rhs': ':PlugUpdate<cr>',
      \    },
      \    'upgrade': {
      \        'mod': 'normal',
      \        'lhs': '<leader>pg',
      \        'rhs': ':PlugUpgrade<cr>',
      \    },
      \    'clean': {
      \        'mod': 'normal',
      \        'lhs': '<leader>pc',
      \        'rhs': ':PlugClean<cr>',
      \    },
      \},
      \'fugitive_git_interface': {
      \    'git_status': {
      \        'mod': 'normal',
      \        'lhs': '<leader>gs',
      \        'rhs': ':Git<cr>',
      \    },
      \},
      \'goyo': {
      \    'toggle': {
      \        'mod': 'normal',
      \        'lhs': '<leader>gy',
      \        'rhs': ':Goyo<cr>',
      \    },
      \},
      \'limelight': {
      \    'toggle_on': {
      \        'mod': 'normal',
      \        'lhs': '<leader>ln',
      \        'rhs': ':Limelight<cr>',
      \    },
      \    'toggle_off': {
      \        'mod': 'normal',
      \        'lhs': '<leader>lf',
      \        'rhs': ':Limelight!<cr>',
      \    },
      \},
      \'change_capitalization_of_words': {
      \    'to_upper_case': {
      \        'mod': 'insert',
      \        'lhs': '<leader>tu',
      \        'rhs': '<esc>mmbgUiw`ma',
      \    },
      \    'to_lower_case': {
      \        'mod': 'insert',
      \        'lhs': '<leader>tl',
      \        'rhs': '<esc>mmbguiw`ma',
      \    },
      \    'captilize_the_first_letter': {
      \        'mod': 'insert',
      \        'lhs': '<leader>cc',
      \        'rhs': '<esc>mmb~`ma',
      \    },
      \},
      \'search_and_replace': {
      \    'subs_word_under_the_cursor_with_the_contents_of_register': {
      \        'mod': 'normal',
      \        'lhs': '<leader>rw',
      \        'rhs': ':call BetterSubstitution()<cr>',
      \    },
      \},
      \'fuzzy_file_finding': {
      \    'searching_by_filename': {
      \        'mod': 'normal',
      \        'lhs': '<leader>sf',
      \        'rhs': ':FZF<cr>',
      \    },
      \    'searching_by_contents': {
      \        'mod': 'normal',
      \        'lhs': '<leader>sa',
      \        'rhs': ':Ag<cr>',
      \    },
      \},
      \'edit_snippets': {
      \    'ultisnipsedit': {
      \        'mod': 'normal',
      \        'lhs': '<leader>se',
      \        'rhs': ':UltiSnipsEdit<cr>',
      \    },
      \},
      \'help_and_manpages': {
      \    'help': {
      \        'mod': 'normal',
      \        'lhs': '<leader>hh',
      \        'rhs': ':tab h ',
      \    },
      \    'search_for_the_word_under_the_cursor': {
      \        'mod': 'normal',
      \        'lhs': '<leader>hw',
      \        'rhs': ':exe ''tab h '' . expand(''<cword>'')<cr>',
      \    },
      \    'manpages': {
      \        'mod': 'normal',
      \        'lhs': '<leader>mp',
      \        'rhs': ':tab Man ',
      \    },
      \},
      \'useful_regexes': {
      \    'change_capitalization_of_D[aeo]s?': {
      \        'mod': 'normal',
      \        'lhs': '<leader>cd',
      \        'rhs': ':%s@\\<D\\([aeo]s\\?\\)\\>@d\\1@g<cr>',
      \    },
      \    'convert_data_to_iso_format': {
      \        'mod': 'normal',
      \        'lhs': '<leader>id',
      \        'rhs': ':%s@\\(0[1-9]\\\\|[12][0-9]\\\\|3[01]\\)\\/\\(0[1-9]\\\\|1[012]\\)\\/\\(202[3-9]\\)@\\3-\\2-\\1@g<cr>',
      \    },
      \    'convert_values_to_the_ledger_format': {
      \        'mod': 'normal',
      \        'lhs': '<leader>im',
      \        'rhs': ':%s@R$\\s\\+\\([0-9.]\\+\\),\\([0-9]\\+\\)\\s(\\([+-]\\))$@\\3\\1\\.\\2\\ BRL@<cr>',
      \    },
      \},
      \}
" }}}

for category in values(s:catalogue_of_keybindings)
  for keybinding in values(category)
    let s:mod = keybinding['mod']
    let s:lhs = keybinding['lhs']
    let s:rhs = keybinding['rhs']
    sil call Keymap(s:mod, s:lhs, s:rhs)
  endfor
endfor
