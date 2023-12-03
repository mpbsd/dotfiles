return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable "make" == 1
      end,
    },
  },
  config = function()
    pcall(require("telescope").load_extension, "fzf")
    local builtin = require("telescope.builtin")
    local themes = require("telescope.themes")
    -- local actions = require("telescope.actions")
    -- local defaults = {
    --   mappings = {
    --     i = {
    --       ["<c-j>"] = actions.move_selection_next,
    --       ["<c-k>"] = actions.move_selection_previous,
    --       ["<c-q>"] = actions.send_selected_to_qflist + actions.openqflist,
    --     },
    --   },
    -- }
    vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
    vim.keymap.set("n", "<leader>,", builtin.buffers, { desc = "[,] Find existing buffers" })
    vim.keymap.set(
      "n",
      "<leader>/",
      function()
        builtin.current_buffer_fuzzy_find(
          themes.get_dropdown {
            winblend = 10,
            previewer = false,
          }
        )
      end,
      { desc = "[/] Fuzzily search in current buffer" }
    )
    vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Search [G]it [F]iles" })
    vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
    vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
    vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
    vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
  end
}
