return {
  'akinsho/toggleterm.nvim',
  config = function()
    require('toggleterm').setup(
      {
        open_mapping = [[<c-\>]],
        start_in_insert = true,
        autochdir = true,
        direction = "float",
        close_on_exit = true,
      }
    )
  end
}
