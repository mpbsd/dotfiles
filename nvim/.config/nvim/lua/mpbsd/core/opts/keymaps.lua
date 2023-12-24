local keymaps = {
  {
    mod = "n",
    lhs = "<leader>erc",
    rhs = ":edit ~/.config/nvim/init.lua<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[e]dit vim[r][c]",
    }
  },
  {
    mod = "n",
    lhs = "<leader>eac",
    rhs = ":edit ~/.config/nvim/lua/mpbsd/core/opts/autocmd.lua<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[e]dit [a]uto[c]ommands",
    }
  },
  {
    mod = "n",
    lhs = "<leader>egb",
    rhs = ":edit ~/.config/nvim/lua/mpbsd/core/opts/globals.lua<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[e]dit [g]lo[b]al resources",
    }
  },
  {
    mod = "n",
    lhs = "<leader>ekm",
    rhs = ":edit ~/.config/nvim/lua/mpbsd/core/opts/keymaps.lua<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[e]dit [k]ey[m]aps",
    }
  },
  {
    mod = "n",
    lhs = "<leader>eop",
    rhs = ":edit ~/.config/nvim/lua/mpbsd/core/opts/general.lua<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[e]dit [o][p]tions",
    }
  },
  {
    mod = "n",
    lhs = "<leader>epg",
    rhs = ":edit ~/.config/nvim/lua/mpbsd/plug/<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[e]dit [p]lu[g]ins",
    }
  },
  {
    mod = "n",
    lhs = "<leader>src",
    rhs = ":source ~/.config/nvim/init.lua<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[s]ource vim[r][c]",
    }
  },
  {
    mod = "n",
    lhs = "<leader>sac",
    rhs = ":source ~/.config/nvim/lua/mpbsd/core/opts/autocmd.lua<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[s]ource [a]uto[c]ommands",
    }
  },
  {
    mod = "n",
    lhs = "<leader>sgb",
    rhs = ":source ~/.config/nvim/lua/mpbsd/core/opts/globals.lua<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[s]ource [g]lo[b]al resources",
    }
  },
  {
    mod = "n",
    lhs = "<leader>skm",
    rhs = ":source ~/.config/nvim/lua/mpbsd/core/opts/keymaps.lua<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[s]ource [k]ey[m]aps",
    }
  },
  {
    mod = "n",
    lhs = "<leader>sop",
    rhs = ":source ~/.config/nvim/lua/mpbsd/core/opts/general.lua<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[s]ource [o][p]tions",
    }
  },
  {
    mod = "n",
    lhs = "<leader>spg",
    rhs = ":source ~/.config/nvim/lua/mpbsd/plug/<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[s]ource [p]lu[g]ins",
    }
  },
  {
    mod = "n",
    lhs = "<leader>;",
    rhs = ":",
    opt = {
      silent = false,
      noremap = true,
      desc = "get into command mode without hitting the shift key",
    }
  },
  {
    mod = "i",
    lhs = "jj",
    rhs = "<esc>",
    opt = {
      silent = false,
      noremap = true,
      desc = "back to normal mode from insert mode",
    }
  },
  {
    mod = "n",
    lhs = "<leader>w;",
    rhs = ":w<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[w]ri[t]e",
    }
  },
  {
    mod = "n",
    lhs = "<leader>q;",
    rhs = ":q<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[q][u]it",
    }
  },
  {
    mod = "n",
    lhs = "<c-h>",
    rhs = "<c-w>h",
    opt = {
      silent = false,
      noremap = true,
      desc = "move focus to the left window",
    }
  },
  {
    mod = "n",
    lhs = "<c-j>",
    rhs = "<c-w>j",
    opt = {
      silent = false,
      noremap = true,
      desc = "move focus to the window below",
    }
  },
  {
    mod = "n",
    lhs = "<c-k>",
    rhs = "<c-w>k",
    opt = {
      silent = false,
      noremap = true,
      desc = "move focus to the window above",
    }
  },
  {
    mod = "n",
    lhs = "<c-l>",
    rhs = "<c-w>l",
    opt = {
      silent = false,
      noremap = true,
      desc = "move focus to the right window",
    }
  },
  {
    mod = "n",
    lhs = "<leader>sh",
    rhs = ":sp<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[s]plit window [h]orizontally",
    }
  },
  {
    mod = "n",
    lhs = "<leader>sv",
    rhs = ":vs<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[s]plit window [v]erticaly",
    }
  },
  {
    mod = "n",
    lhs = "<c-left>",
    rhs = "<c-w>>",
    opt = {
      silent = false,
      noremap = true,
      desc = "increase window width",
    }
  },
  {
    mod = "n",
    lhs = "<c-down>",
    rhs = "<c-w>-",
    opt = {
      silent = false,
      noremap = true,
      desc = "decrease window height",
    }
  },
  {
    mod = "n",
    lhs = "<c-up>",
    rhs = "<c-w>+",
    opt = {
      silent = false,
      noremap = true,
      desc = "increase window height",
    }
  },
  {
    mod = "n",
    lhs = "<c-right>",
    rhs = "<c-w><",
    opt = {
      silent = false,
      noremap = true,
      desc = "decrease window width",
    }
  },
  {
    mod = "n",
    lhs = "<leader>ab",
    rhs = ":call AddWordUnderCursorToMyAbbreviationsList()<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[a]dd the word under the cursor to my a[b]breviations list",
    }
  },
  {
    mod = "n",
    lhs = "<leader>aw",
    rhs = ":call AddWordUnderCursorToMyWordsList()<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[a]dd the word under the cursor to my words list",
    }
  },
  {
    mod = "n",
    lhs = "<leader>eab",
    rhs = ":edit ~/.config/nvim/spell/words.abbr<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[e]dit [a][b]breviations",
    }
  },
  {
    mod = "n",
    lhs = "<leader>ewo",
    rhs = ":edit ~/.config/nvim/spell/words.dict<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[e]dit [w]ords",
    }
  },
  {
    mod = "n",
    lhs = "<leader>pi",
    rhs = ":PlugInstall<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[p]lug [i]install",
    }
  },
  {
    mod = "n",
    lhs = "<leader>pu",
    rhs = ":PlugUpdate<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[p]lug [u]pdate",
    }
  },
  {
    mod = "n",
    lhs = "<leader>pg",
    rhs = ":PlugUpgrade<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[p]lug up[g]rade",
    }
  },
  {
    mod = "n",
    lhs = "<leader>pc",
    rhs = ":PlugClean<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[p]lug [c]lean",
    }
  },
  {
    mod = "n",
    lhs = "<leader>gs",
    rhs = ":Git<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[g]it [s]tatus",
    }
  },
  {
    mod = "n",
    lhs = "<leader>gy",
    rhs = ":Goyo<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[g]o[y]o",
    }
  },
  {
    mod = "n",
    lhs = "<leader>ln",
    rhs = ":Limelight<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[l]imelight o[n]",
    }
  },
  {
    mod = "n",
    lhs = "<leader>lf",
    rhs = ":Limelight!<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[l]imelight o[f]f",
    }
  },
  {
    mod = "i",
    lhs = "<leader>tu",
    rhs = "<esc>mmbgUiw`ma",
    opt = {
      silent = false,
      noremap = true,
      desc = "[t]o [u]pper case",
    }
  },
  {
    mod = "i",
    lhs = "<leader>tl",
    rhs = "<esc>mmbguiw`ma",
    opt = {
      silent = false,
      noremap = true,
      desc = "[t]o [l]ower case",
    }
  },
  {
    mod = "i",
    lhs = "<leader>cc",
    rhs = "<esc>mmb~`ma",
    opt = {
      silent = false,
      noremap = true,
      desc = "[c]amel [c]ase",
    }
  },
  {
    mod = "n",
    lhs = "<leader>sf",
    rhs = ":FZF<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[s]earch [f]ile",
    }
  },
  {
    mod = "n",
    lhs = "<leader>ht",
    rhs = ":tab h ",
    opt = {
      silent = false,
      noremap = true,
      desc = "open [h]elp in another [t]ab",
    }
  },
  {
    mod = "n",
    lhs = "<leader>mp",
    rhs = ":tab Man ",
    opt = {
      silent = false,
      noremap = true,
      desc = "open [m]an [p]age in another tab",
    },
  },
  {
    mod = "n",
    lhs = "<leader>cd",
    rhs = ":%s@\\<D\\([aeo]s\\?\\)\\>@d\\1@g<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[c]hange the capitalization of [d][aeo]s?",
    },
  },
  {
    mod = "n",
    lhs = "<leader>id",
    rhs = ":%s@\\(0[1-9]\\\\|[12][0-9]\\\\|3[01]\\)\\/\\(0[1-9]\\\\|1[012]\\)\\/\\(202[3-9]\\)@\\3-\\2-\\1@g<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[i]so [d]ate",
    },
  },
  {
    mod = "n",
    lhs = "<leader>cm",
    rhs = ":%s@R$\\s\\+\\([0-9.]\\+\\),\\([0-9]\\+\\)\\s(\\([+-]\\))$@\\3\\1\\.\\2\\ BRL@<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[c]onvert [m]oney",
    },
  },
  {
    mod = "n",
    lhs = "<leader>ls",
    rhs = function()
      pcall(require("lazy").sync)
    end,
    opt = {
      silent = false,
      noremap = true,
      desc    = "[l]azy [s]ync",
    }
  },
}


Keymap(keymaps)


--  {
--    mod = "n",
--    lhs = "<leader>hw",
--    rhs = ":exe tab h " .. expand("<cword>") .. "<cr>",
--    opt = {
--      silent = false,
--      noremap = true,
--      desc = "searc[h] for the [w]ord under the cursor in the help pages",
--    },
--  },
