return {
  "akinsho/toggleterm.nvim",
  tag = "",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-\>]],
      -- start_in_insert = true,
      close_on_exit = true,
      direction = "float",
      float_opts = {
        border = "single",
      },
    })
  end
}
