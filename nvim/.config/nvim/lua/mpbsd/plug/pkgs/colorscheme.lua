return {
  'catppuccin/nvim',
  priority = 1000,
  opts = { name = 'catppuccin', style = 'macchiato' },
  config = function()
    vim.cmd.colorscheme('catppuccin')
  end
}
