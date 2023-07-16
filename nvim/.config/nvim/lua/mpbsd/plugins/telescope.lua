return {
  "nvim-telescope/telescope.nvim",
  version = "0.1.2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { noremap = true, silent = true })
  end
}
