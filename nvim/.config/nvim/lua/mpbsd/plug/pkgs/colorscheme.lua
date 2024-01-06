return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  config = function()
    -- vim.g.catppuccin_flavour = 'latte'
    vim.g.catppuccin_flavour = 'frappe'
    -- vim.g.catppuccin_flavour = 'macchiato'
    -- vim.g.catppuccin_flavour = 'mocha'
    vim.cmd.colorscheme('catppuccin')
  end
}
