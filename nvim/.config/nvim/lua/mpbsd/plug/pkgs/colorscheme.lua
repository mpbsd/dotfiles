return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  opts = { style = 'frappe' },
  config = function()
    vim.cmd.colorscheme('catppuccin')
  end
}
