return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    on_attach = function(_, bufnr)
      local gitsigns = require("gitsigns")
      local keymapset = require("mpbsd.core.opts.globals").keymapset
      keymapset({
        {
          mod = "n",
          lhs = "<leader>gp",
          rhs = gitsigns.prev_hunk,
          opt = {
            buffer = bufnr,
            desc   = "[G]o to [P]revious Hunk",
          }
        },
        {
          mod = "n",
          lhs = "<leader>gn",
          rhs = gitsigns.next_hunk,
          opt = {
            buffer = bufnr,
            desc   = "[G]o to [N]ext Hunk",
          }
        },
        {
          mod = "n",
          lhs = "<leader>ph",
          rhs = gitsigns.preview_hunk,
          opt = {
            buffer = bufnr,
            desc = "[P]review [H]unk",
          },
        }
      })
    end,
  },
}
