local globals = require("mpbsd.core.opts.globals")

-- keymaps {{{
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
    lhs = "<leader>s-",
    rhs = ":sp<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[s]plit window [h]orizontally",
    }
  },
  {
    mod = "n",
    lhs = [[<leader>s\]],
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
    lhs = "<leader>gs",
    rhs = ":Git<cr>",
    opt = {
      silent = false,
      noremap = true,
      desc = "[g]it [s]tatus",
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
    rhs = [[:%s@\<D\([aeo]s\?\)\>@d\1@g<cr>]],
    opt = {
      silent = false,
      noremap = true,
      desc = "[c]hange the capitalization of [d][aeo]s?",
    },
  },
  {
    mod = "n",
    lhs = "<leader>ls",
    rhs = function()
      pcall(require("lazy").sync)
    end,
    opt = {
      silent  = false,
      noremap = true,
      desc    = "[l]azy [s]ync",
    }
  },
}
-- }}}

globals.vim_keymap_set(keymaps)
