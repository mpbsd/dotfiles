return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  opts = { style = 'mocha' },
  config = function()
    vim.cmd.colorscheme('catppuccin')
  end
}
