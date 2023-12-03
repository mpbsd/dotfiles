local catalogue_of_keybindings  = {-- {{{
  edit_vimrc_files = {
    default = {
      mod = "n",
      key = "<localleader>erc",
      act = ":edit ~/.config/nvim/init.lua<cr>",
    },
    options = {
      mod = "n",
      key = "<localleader>eop",
      act = ":edit ~/.config/nvim/lua/mpbsd/core/opts/options.lua<cr>",
    },
    globals = {
      mod = "n",
      key = "<localleader>egb",
      act = ":edit ~/.config/nvim/lua/mpbsd/core/opts/globals.lua<cr>",
    },
    autocmd = {
      mod = "n",
      key = "<localleader>eac",
      act = ":edit ~/.config/nvim/lua/mpbsd/core/opts/autocmd.lua<cr>",
    },
    keymaps = {
      mod = "n",
      key = "<localleader>ekm",
      act = ":edit ~/.config/nvim/lua/mpbsd/core/opts/keymaps.lua<cr>",
    },
    abbrevs = {
      mod = "n",
      key = "<localleader>eab",
      act = ":edit ~/.config/nvim/lua/mpbsd/core/opts/abbrevs.lua<cr>",
    },
    plugins = {
      mod = "n",
      key = "<localleader>epg",
      act = ":edit ~/.config/nvim/lua/mpbsd/plug<cr>",
    },
  },
  source_vimrc_files = {
    default = {
      mod = "n",
      key = "<localleader>src",
      act = ":source ~/.config/nvim/init.lua<cr>",
    },
    options = {
      mod = "n",
      key = "<localleader>sop",
      act = ":source ~/.config/nvim/lua/mpbsd/core/opts/options.lua<cr>",
    },
    globals = {
      mod = "n",
      key = "<localleader>sgb",
      act = ":source ~/.config/nvim/lua/mpbsd/core/opts/globals.lua<cr>",
    },
    autocmd = {
      mod = "n",
      key = "<localleader>sac",
      act = ":source ~/.config/nvim/lua/mpbsd/core/opts/autocmd.lua<cr>",
    },
    keymaps = {
      mod = "n",
      key = "<localleader>skm",
      act = ":source ~/.config/nvim/lua/mpbsd/core/opts/keymaps.lua<cr>",
    },
    abbrevs = {
      mod = "n",
      key = "<localleader>sab",
      act = ":source ~/.config/nvim/lua/mpbsd/core/opts/abbrevs.lua<cr>",
    },
  },
  get_into_normal_mode = {
    from_insert_mode = {
      mod = "i",
      key = "jj",
      act = "<esc>",
    },
  },
  get_into_command_mode = {
    from_normal_mode = {
      mod = "n",
      key = "<localleader>;",
      act = ":",
    },
  },
  dealing_with_files_in_general = {
    saving = {
      mod = "n",
      key = "<localleader>fw",
      act = ":w<cr>",
    },
  },
  window_management = {
    closing = {
      mod = "n",
      key = "<localleader>fq",
      act = ":q<cr>",
    },
    move_focus_to_the_left_window = {
      mod = "n",
      key = "<c-h>",
      act = "<c-w>h",
    },
    move_focus_to_the_downward_window = {
      mod = "n",
      key = "<c-j>",
      act = "<c-w>j",
    },
    move_focus_to_the_upward_window = {
      mod = "n",
      key = "<c-k>",
      act = "<c-w>k",
    },
    move_focus_to_the_right_window = {
      mod = "n",
      key = "<c-l>",
      act = "<c-w>l",
    },
    split_the_window_vertically = {
      mod = "n",
      key = "<localleader>sp",
      act = ":sp<cr>",
    },
    split_the_window_horizontally = {
      mod = "n",
      key = "<localleader>vs",
      act = ":vs<cr>",
    },
    increase_width = {
      mod = "n",
      key = "<c-left>",
      act = "<c-w>>",
    },
    decrease_height = {
      mod = "n",
      key = "<c-down>",
      act = "<c-w>-",
    },
    increase_height = {
      mod = "n",
      key = "<c-up>",
      act = "<c-w>+",
    },
    decrease_width = {
      mod = "n",
      key = "<c-right>",
      act = "<c-w><",
    },
  },
  change_capitalization_of_words = {
    all_upper_case = {
      mod = "i",
      key = "<localleader>tu",
      act = "<esc>mmbgUiw`ma",
    },
    all_lower_case = {
      mod = "i",
      key = "<localleader>tl",
      act = "<esc>mmbguiw`ma",
    },
    only_the_first_letter = {
      mod = "i",
      key = "<localleader>cc",
      act = "<esc>mmb~`ma",
    },
  },
  accessing_manpages_from_within_vim = {
    opening = {
      mod = "n",
      key = "<localleader>mp",
      act = ":Man ",
    },
  },
  useful_regexes = {
    change_capitalization_of_Daeos = {
      mod = "n",
      key = "<localleader>cd",
      act = ":%s@\\<D\\([aeo]s\\?\\)\\>@d\\1@g<cr>",
    },
    change_date_iso_format = {
      mod = "n",
      key = "<localleader>id",
      act = ":%s@\\(0[1-9]\\|[12][0-9]\\|3[01]\\)\\/\\(0[1-9]\\|1[012]\\)\\/\\(202[3-9]\\)@\\3-\\2-\\1@g<cr>",
    },
    convert_values_to_the_ledger_format = {
      mod = "n",
      key = "<localleader>im",
      act = ":%s@R$\\s\\+\\([0-9.]\\+\\),\\([0-9]\\+\\)\\s(\\([+-]\\))$@\\3\\1\\.\\2\\ BRL@<cr>",
    },
  },
}-- }}}

for _, keybinding_category in pairs(catalogue_of_keybindings) do
  for _, keybinding in pairs(keybinding_category) do
    local mod = keybinding["mod"]
    local key = keybinding["key"]
    local act = keybinding["act"]
    Keymap(mod, key, act)
  end
end
