local keymaps = {
  {
    mod = "n",
    lhs = "<leader>erc",
    rhs = ":edit ~/.config/nvim/init.lua<cr>",
    opt = {
      silent  = true,
      noremap = true,
      desc    = "[e]dit vim[r][c] file",
    }
  },
  {
    mod = "n",
    lhs = "<leader>eop",
    rhs = ":edit ~/.config/nvim/lua/mpbsd/core/opts/general.lua<cr>",
    opt = {
      silent  = true,
      noremap = true,
      desc    = "[e]dit general [o][p]tions file",
    }
  },
  {
    mod = "n",
    lhs = "<leader>epg",
    rhs = ":edit ~/.config/nvim/lua/mpbsd/plug<cr>",
    opt = {
      silent  = true,
      noremap = true,
      desc    = "[e]dit [p]lu[g]ins",
    }
  },
  {
    mod = "n",
    lhs = "<leader>ekm",
    rhs = ":edit ~/.config/nvim/lua/mpbsd/core/opts/keymaps.lua<cr>",
    opt = {
      silent  = true,
      noremap = true,
      desc    = "[e]dit [k]ey[m]aps file",
    }
  },
  {
    mod = "n",
    lhs = "<leader>src",
    rhs = ":source ~/.config/nvim/init.lua<cr>",
    opt = {
      silent  = true,
      noremap = true,
      desc    = "[s]ource vim[r][c] file",
    }
  },
  {
    mod = "n",
    lhs = "<leader>sop",
    rhs = ":source ~/.config/nvim/lua/mpbsd/core/opts/general.lua<cr>",
    opt = {
      silent  = true,
      noremap = true,
      desc    = "[s]ource general [o][p]tions file",
    }
  },
  {
    mod = "n",
    lhs = "<leader>skm",
    rhs = ":source ~/.config/nvim/lua/mpbsd/core/opts/keymaps.lua<cr>",
    opt = {
      silent  = true,
      noremap = true,
      desc    = "[s]ource [k]ey[m]aps file",
    }
  },
  {
    mod = "n",
    lhs = "<leader>wt",
    rhs = ":w<cr>",
    opt = {
      silent  = true,
      noremap = true,
      desc    = "[w]ri[t]e",
    }
  },
  {
    mod = "n",
    lhs = "<leader>qu",
    rhs = ":q<cr>",
    opt = {
      silent  = true,
      noremap = true,
      desc    = "[q][u]it",
    }
  },
  {
    mod = "n",
    lhs = "<leader>ls",
    rhs = function()
      pcall(require("lazy").sync)
    end,
    opt = {
      silent  = true,
      noremap = true,
      desc    = "[l]azy [s]ync",
    }
  },
}


for _, keymap in pairs(keymaps) do
  local mod = keymap["mod"]
  local lhs = keymap["lhs"]
  local rhs = keymap["rhs"]
  local opt = keymap["opt"]
  vim.keymap.set(mod, lhs, rhs, opt)
end
